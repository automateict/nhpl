class CreateAppeals < ActiveRecord::Migration[5.2]
  def change
    create_table :appeals do |t|
      t.references :applicant, foreign_key: true
      t.string :subject
      t.text :body
      t.boolean :status

      t.timestamps
    end
  end
end
