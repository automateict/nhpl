class CreateLicenseResults < ActiveRecord::Migration[5.2]
  def change
    create_table :license_results do |t|
      t.references :applicant, foreign_key: true
      t.string :result
      t.boolean :published

      t.timestamps
    end
  end
end
