class Applicant < ApplicationRecord
    has_many :program_choices, dependent: :destroy
    belongs_to :user
    belongs_to :region
    belongs_to :applicant_type
    belongs_to :exam_type
    has_one :match_result
    has_one :applicant_exam_hub, dependent: :destroy
    has_one :applicant_service,  dependent: :destroy
    has_one :applicant_declaration
    has_many :declaration_details, through: :applicant_declaration
    has_one :exam
    has_one :placement
    belongs_to :program
    belongs_to :university
    has_many_attached :file

    validates :title, :gender, :first_name, :father_name, :grand_father_name,
              :date_of_birth, :marital_status, :phone, :city, presence: true

    validates :user_id, uniqueness: {scope: :academic_year_id,
                                     message: 'already started application. Please go to Home --> Application Details and edit your application'}
    STATUSES = ['New']

    scope :complete, -> { where('status is true') }

    def published_placemet
      unless placement.blank?
        return placement if placement.published?
      end
    end

    def complete_program_choices
      program_choices.where('program_id is not null')
    end

    def self.placement_conducted(cay=AcademicYear.current)
      Placement.joins(:applicant).where('academic_year_id = ?', cay.try(:id)).size > 0
    end

    def matching_status
      Applicant.placement_conducted == true ? (!published_placemet.blank? ? 'Matched' : 'Unmatched') : 'Coming Soon'
    end

    def application_status
         status == true ? 'Submitted' : 'Draft'
    end

    def application_complete
      !applicant_exam_hub.blank? and !complete_program_choices.blank? and !complete_university_choices.blank? and !attachment.blank?
    end

    def full_name
      [title, first_name, father_name, grand_father_name].join(' ')
    end

    def self.match
      applicants = Applicant.unplaced_applicants
      programs = Program.joins(:program_quota).select{|x| x.unplaced_applicants.count > 0 }
      if !programs.blank? and !applicants.blank?
        Applicant.iterate_applicants(applicants)
      end
    end

    def total_result
      exam.total
    end

    def self.match
      applicants = Applicant.unplaced_applicants
      Applicant.iterate_applicants(applicants)
    end

    def self.unplaced_applicants
      Applicant.joins([:program_choices=>:university_choices],:exam).where('total is not NULL').includes(:placement).where(placements: {id: nil}).
          order('exams.total DESC')
    end

    def self.iterate_applicants(applicants)
      applicants.each do |a|
        placed = false
        a.complete_program_choices.order('choice_order').each do |pc|
          pc.complete_university_choices.order('choice_order').each do |uc|
            placed = Applicant.final_match(a,pc,uc)
            break if placed==true
          end
          break if placed==true
        end
      end
    end

    def self.final_match(applicant,pc,uc)
      match_result = false
      if pc.program.remaining_quota(uc.try(:university_id)) > 0
        Placement.create(applicant_id: applicant.id, program_id: pc.program_id, university_id: uc.university_id)
        match_result = true
      end
      return match_result
    end

  def to_s
    full_name
  end

end
