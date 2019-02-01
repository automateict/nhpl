class ApplicantExamHub < ApplicationRecord
  belongs_to :applicant
  belongs_to :exam_hub

  validates :exam_hub_id, presence: true
  validate :validate_ceiling

  def validate_ceiling
    if exam_hub.total_applicants.reject{ |a| a == self.applicant}.count >= exam_hub.ceiling
      errors.add('exam_hub_id', 'is already full, please select another exam hub')
    end
  end

  def to_s
    exam_hub
  end
end
