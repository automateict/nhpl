class CreateApplicantExamHubs < ActiveRecord::Migration[5.1]
  def change
    create_table :applicant_exam_hubs do |t|
      t.references :applicant, foreign_key: true
      t.references :exam_hub, foreign_key: true

      t.timestamps
    end
  end
end
