json.extract! game, :id, :title, :rating, :hours, :review, :created_at, :updated_at
json.url game_url(game, format: :json)
