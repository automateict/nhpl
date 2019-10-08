class Applicant < ApplicationRecord
    belongs_to :user
    belongs_to :academic_year
    belongs_to :region, optional: true
    has_one :match_result
    has_one :applicant_declaration
    has_many :declaration_details, through: :applicant_declaration
    has_one :exam
    has_one :placement
    belongs_to :program
    belongs_to :university
    has_one :license_result
    has_one_attached :passport_size_photo
    has_one_attached :passport_or_admission_card

    belongs_to :exam_hub

    after_create :set_application_id if :registration_id_blank

    validates :gender, :first_name, :father_name, :grand_father_name, :exam_hub_id, :passport_size_photo, :applicant_type, :passport_or_admission_card,
              :date_of_birth, :marital_status, :phone, :city, :i_understand, :i_give_my_permission, presence: true

    validates :user_id, uniqueness: {scope: :academic_year_id,
                                     message: 'already started application. Please go to Home --> Application Details and edit your application'}
    STATUSES = ['New']
    GRADING_STATUS = Applicant.all.pluck('grading_status').uniq.reject{|x| x.blank?}
    APPLICANT_TYPES = [LOCAL = 'Local', INTERNATIONAL='International']
    EXAM_TYPES = [MCQ = 'MCQ', OCQI='OCQI', MCQ_AND_OCQI = 'MCQ and OCQI']

    scope :complete, -> { where('status is true') }

    def country_name
      country = ISO3166::Country[nationality]
      country.translations[I18n.locale.to_s] || country.name
    end

    def registration_id_blank
      application_id.blank?
    end
    def self.import_applicants(file, academic_year)
      applicants = []
      CSV.foreach(file.path, :headers=>true) do |row|
        id_number = row[0]
        first_name = row[1]
        father_name = row[2]
        grand_father_name = row[3]
        university = University.find_or_create_by(name: row[4])
        program = Program.find_or_create_by(name: row[5])
        grading_status = row[6]
          unless program.blank? or university.blank?
            attrbts = {application_id: id_number,academic_year_id: academic_year, first_name: first_name, father_name: father_name,
                       grand_father_name: grand_father_name, grading_status: grading_status, university_id: university.id,
                       program_id: program.id }
            applicant = Applicant.find_by(application_id: id_number) || Applicant.new(attrbts)
            applicant.attributes = attrbts
            applicant.save(validate: false)
            applicants << applicant
          end
      end
      return applicants
    end


    def set_application_id
      sno = program.applicants_count.to_s
      while sno.length < 3
       sno = '0' << sno
      end
      update_attribute('application_id', university.short_name << program.code << sno << '/' << AcademicYear.current.code)
    end

    def publish_status
      exam.blank? ? 'In Progress' : (published_result ? 'Published' : 'Not Published')
    end

    def published_result
      unless license_result.blank?
        return license_result if license_result.published?
      end
    end

    def published_exam
      unless exam.blank?
        return exam if exam.published?
      end
    end

    def complete_program_choices
      program_choices.where('program_id is not null')
    end

    def self.placement_conducted(cay=AcademicYear.current)
      Placement.joins(:applicant).where('academic_year_id = ?', cay.try(:id)).size > 0
    end

    def application_status
         status == true ? 'Submitted' : 'Draft'
    end

    def application_complete
      !applicant_exam_hub.blank? and !complete_program_choices.blank? and !complete_university_choices.blank? and !attachment.blank?
    end

    def full_name
      [first_name, father_name, grand_father_name].join(' ')
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

    def self.grade(ay = AcademicYear.current)
      applicants = Applicant.all
      applicants.each do |a|
        passing_mark = ExamSetting.where('program_id = ? and academic_year_id = ?', a.program_id, ay.id).first.try(:passing_mark)
        unless passing_mark.blank?
          if a.exam and a.exam.exam_result >= passing_mark
            grading_status = Applicant::PASS
          else
            grading_status = Applicant::FAIL
          end
          license_result = a.license_result
          unless license_result.blank?
            license_result.update(result: grading_status)
          else
            LicenseResult.create(applicant_id: a.id, result: grading_status)
          end
        a.update(grading_status: grading_status)
        end
      end
    end

    def self.ungraded_applicants
      Applicant.joins(:license_result).where(license_results: {id: nil})
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
