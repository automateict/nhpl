json.extract! exam_setting, :id, :academic_year_id, :program_id, :passing_mark, :created_at, :updated_at
json.url exam_setting_url(exam_setting, format: :json)
