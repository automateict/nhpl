class Placement < ApplicationRecord
  belongs_to :applicant
  belongs_to :program
  belongs_to :university

  def published_status
    published == true ? 'Yes' : ''
  end

end
