class UpdateAcademicYear < ActiveRecord::Migration[5.2]
  def change
    add_column :academic_years, :code, :string
  end
end
