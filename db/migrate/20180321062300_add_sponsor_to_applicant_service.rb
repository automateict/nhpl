class AddSponsorToApplicantService < ActiveRecord::Migration[5.1]
  def change
    add_column :applicant_services, :sponsor, :string
  end
end
