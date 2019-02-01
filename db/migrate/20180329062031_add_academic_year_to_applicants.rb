class AddAcademicYearToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_reference :applicants, :academic_year, foreign_key: true
  end
end
