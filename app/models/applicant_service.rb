class ApplicantService < ApplicationRecord

  belongs_to :applicant
  has_many :services, dependent: :destroy

  validates :status, :sponsor, presence: true

  accepts_nested_attributes_for :services, allow_destroy: true

end
