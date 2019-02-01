class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :academic_year, foreign_key: true
      t.string :name
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
