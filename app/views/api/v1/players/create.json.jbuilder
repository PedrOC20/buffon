json.data do
  json.user do
    json.partial: 'api/v1/players/contact', player: @player
  end
end