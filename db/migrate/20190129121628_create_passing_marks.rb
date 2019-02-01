class CreatePassingMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :passing_marks do |t|
      t.references :academic_year, foreign_key: true
      t.references :program, foreign_key: true
      t.float :passing_mark

      t.timestamps
    end
  end
end
