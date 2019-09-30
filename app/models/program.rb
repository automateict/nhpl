class Program < ApplicationRecord
    has_many :program_choices
    has_many :program_quotas
    has_many :university_choices, through: :program_choices
    has_many :placements
    validates :name, :code, presence: true


    def applicants_count(ay=AcademicYear.current)
        ay.applicants.where(program_id: self.id).count
    end

    def ay_applicants_by_university_by_license_status(ay = AcademicYear.current, university, status)
        ay.applicants.where('applicants.program_id = ? and applicants.university_id = ? and grading_status = ?',
                                                          self.id, university, status)
    end

    def universities(academic_year=AcademicYear.current.try(:id))
        University.joins(:program_quotas).where('academic_year_id = ? and program_id = ?', 
        academic_year,self.id)
    end

    def applicant_per_university(university)
      universities.where('university_id = ? and universities = ?', university).size
    end

    def remaining_quota(uninversity,academic_year=AcademicYear.current)
        total_quota(uninversity,academic_year) - total_placed(uninversity,academic_year)
    end

    def total_placed(university,academic_year=AcademicYear.current)
        placements.joins(:applicant).where('academic_year_id = ? and university_id = ?',academic_year.try(:id),university).size
    end

    def total_quota(university, academic_year=AcademicYear.current)
        academic_year.program_quotas.where('program_id = ? and university_id = ?',self.id,university).first.try(:quota) || 0
    end

    def to_s
        name
    end

end
