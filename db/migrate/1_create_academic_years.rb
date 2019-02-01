class CreateAcademicYears < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_years do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
