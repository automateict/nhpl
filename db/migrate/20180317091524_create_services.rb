class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :applicant_service, foreign_key: true
      t.string :institution
      t.references :region, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
