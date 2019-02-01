class Event < ApplicationRecord
  belongs_to :academic_year

  validates :academic_year_id, :name, :start_time, :end_time, presence: true
  validate :end_time_must_be_after_start_time

  def end_time_must_be_after_start_time
    if end_time < start_time
      errors.add(:end_time, 'must be after start time')
    end
  end

end
