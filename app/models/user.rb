class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :applicant

  def admin_status
    admin? ? 'Yes' : '' 
  end

  def current_application
    return Applicant.where('user_id = ? and academic_year_id = ?',self.id,AcademicYear.current.try(:id)).first
  end
  
end
