class CreateDeclarationDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :declaration_details do |t|
      t.references :applicant_declaration, foreign_key: true
      t.references :declaration, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
