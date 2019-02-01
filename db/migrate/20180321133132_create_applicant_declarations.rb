class CreateApplicantDeclarations < ActiveRecord::Migration[5.1]
  def change
    create_table :applicant_declarations do |t|
      t.references :applicant, foreign_key: true

      t.timestamps
    end
  end
end
