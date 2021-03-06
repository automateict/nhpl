class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.references :user, foreign_key: true
      t.references :academic_year, foreign_key: true
      t.string :application_id
      t.string :title
      t.string :first_name
      t.string :father_name
      t.string :grand_father_name
      t.string :gender
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :marital_status
      t.string :nationality

      # current address
      t.references :region, foreign_key: true
      t.string :city
      t.string :street
      t.string :pobox
      t.string :phone

      # Educational Background
      t.references :university, foreign_key: true
      t.string :other_university
      t.string :university_type
      t.string :qualification
      t.date :date_of_completion

      #I am applying to take exam for the program
      t.references :program, foreign_key: true
      t.string :applicant_type
      t.string :exam_type

      #application for special needs
      t.boolean :do_you_have_needs_for_disability
      t.string :disability
      t.string :accomodation_request
      t.boolean :i_understand
      t.boolean :i_give_my_permission

      #applicant application status
      t.boolean :status
      t.string :grading_status

      t.timestamps
    end
  end
end
