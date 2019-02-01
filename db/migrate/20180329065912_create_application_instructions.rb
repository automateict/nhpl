class CreateApplicationInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :application_instructions do |t|
      t.text :content

      t.timestamps
    end
  end
end
