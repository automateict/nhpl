class DeclarationDetail < ApplicationRecord
  belongs_to :applicant_declaration
  belongs_to :declaration

  validates :status, presence: true, unless: :status_is_false

  def status_is_false
    status == false
  end

  def declaration_status
    status == true ? 'Agree' : 'Disagree'
  end

end
