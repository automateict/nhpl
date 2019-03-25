class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.float :exam_weight
      t.float :interview_weight
      t.float :additional_marks_for_female
      t.float :passing_mark

      t.timestamps
    end
  end
end
