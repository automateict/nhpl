class LicenseResult < ApplicationRecord
  belongs_to :applicant

  def publish_status
    published? ? 'Published' : 'Not Published'
  end
end
