class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.references :applicant, foreign_key: true
      t.float :exam_result
      t.float :exam_out_of
      t.float :interview_result
      t.float :interview_out_of
      t.float :total

      t.timestamps
    end
  end
end
