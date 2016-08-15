json.extract! comment, :id, :rating, :comments, :recipe_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)