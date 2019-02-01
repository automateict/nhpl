class AddStatusToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :status, :boolean
  end
end
