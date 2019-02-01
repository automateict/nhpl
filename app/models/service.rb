class Service < ApplicationRecord
  belongs_to :applicant_service
  belongs_to :region

  validates :institution, :region_id, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date
  def end_date_must_be_after_start_date
    if end_date and start_date
      if end_date < start_date
        errors.add(:end_date, 'must be after start date')
      end
    end
  end

end
