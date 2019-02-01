json.extract! applicant, :id, :first_name, :father_name, :grand_father_name, :gender, :date_of_birth, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
