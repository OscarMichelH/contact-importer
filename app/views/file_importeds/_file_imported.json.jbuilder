json.extract! file_imported, :id, :filename, :status, :user_id, :created_at, :updated_at
json.url file_imported_url(file_imported, format: :json)
