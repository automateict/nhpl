class ApplicantDeclaration < ApplicationRecord
  belongs_to :applicant
  has_many :declaration_details

  accepts_nested_attributes_for :declaration_details, allow_destroy: true

end
