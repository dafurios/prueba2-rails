json.extract! todo, :id, :picture, :title, :content, :created_at, :updated_at
json.url todo_url(todo, format: :json)
