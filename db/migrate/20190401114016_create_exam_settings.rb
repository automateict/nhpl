class CreateExamSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_settings do |t|
      t.references :academic_year, foreign_key: true
      t.references :program, foreign_key: true
      t.float :passing_mark

      t.timestamps
    end
  end
end
