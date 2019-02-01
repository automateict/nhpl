class CreateTimers < ActiveRecord::Migration[5.1]
  def change
    create_table :timers do |t|
      t.string :event
      t.datetime :end_date

      t.timestamps
    end
  end
end
