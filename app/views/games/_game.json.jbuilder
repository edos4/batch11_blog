json.extract! game, :id, :name, :genre, :price, :platform, :created_at, :updated_at
json.url game_url(game, format: :json)
