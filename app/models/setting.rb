class Setting < ApplicationRecord

  validates :exam_weight, :interview_weight, :additional_marks_for_female, presence: true

  after_save :update_total

  def update_total
    academic_year = AcademicYear.current
    applicants = academic_year.applicants
    applicants.each do |a|
      a.exam.save unless a.exam.blank?
    end
  end

end
