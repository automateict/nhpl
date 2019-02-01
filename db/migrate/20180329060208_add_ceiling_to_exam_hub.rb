class AddCeilingToExamHub < ActiveRecord::Migration[5.1]
  def change
    add_column :exam_hubs, :ceiling, :integer
  end
end
