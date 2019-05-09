json.extract! appeal, :id, :applicant_id, :subject, :body, :status, :created_at, :updated_at
json.url appeal_url(appeal, format: :json)
