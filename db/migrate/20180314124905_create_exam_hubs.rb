class CreateExamHubs < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_hubs do |t|
      t.string :name
      t.references :region, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
