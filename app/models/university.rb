class University < ApplicationRecord
    
    has_many :applicants
    validates :name, presence: true


    def to_s
        name
    end

  def ay_applicants_by_program(ay=AcademicYear.current, program)
    ay.applicants.where('program_id = ? and university_id = ?', program, self.id)
  end

end
