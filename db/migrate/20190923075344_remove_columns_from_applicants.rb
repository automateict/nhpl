class RemoveColumnsFromApplicants < ActiveRecord::Migration[5.2]
  def change
    remove_column :applicants, :title, :string
    remove_column :applicants, :street, :string
    remove_column :applicants, :pobox, :string
    remove_column :applicants, :date_of_completion, :date
    remove_column :applicants, :exam_type, :string
    remove_column :applicants, :accomodation_request, :string
    add_reference :applicants, :exam_hub
  end
end
