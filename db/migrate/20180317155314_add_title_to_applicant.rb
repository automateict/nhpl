class AddTitleToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :title, :string
  end
end
