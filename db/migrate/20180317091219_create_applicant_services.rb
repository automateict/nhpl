class CreateApplicantServices < ActiveRecord::Migration[5.1]
  def change
    create_table :applicant_services do |t|
      t.references :applicant, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
