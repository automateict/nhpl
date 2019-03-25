class Setting < ApplicationRecord

  validates :exam_weight, :interview_weight, :additional_marks_for_female, :passing_mark, presence: true

end
