json.extract! event, :id, :academic_year_id, :name, :start_time, :end_time, :created_at, :updated_at
json.url event_url(event, format: :json)

json.extract! event, :id, :name, :start_time, :end_time
json.title event.name
json.start event.start_time
json.end event.end_time + 1 rescue nil
json.url event_url(event, format: :html)

