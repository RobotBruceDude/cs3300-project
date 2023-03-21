json.extract! project, :id, :title, :rating, :hours, :review, :created_at, :updated_at
json.url project_url(project, format: :json)
