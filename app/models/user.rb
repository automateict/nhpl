class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :applicant

  ROLES = [ADMIN = 'Admin', APPLICANT = 'Applicant', INSTITUTION = 'Institution']

  def has_role(user_role)
    user_role == role
  end

  def current_application
    return Applicant.where('user_id = ? and academic_year_id = ?',self.id,AcademicYear.current.try(:id)).first
  end

  def applicants
    applicants = []
    if has_role(User::ADMIN)
      applicants = AcademicYear.current.applicants
    elsif has_role(User::INSTITUTION)
      applicants = AcademicYear.current.applicants.where('university_id = ?', university_id)
    end
    return applicants
  end
  
end
