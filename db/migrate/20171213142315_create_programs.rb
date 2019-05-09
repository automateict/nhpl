class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
