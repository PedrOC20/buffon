json.data do
  json.player do
    json.partial: 'api/v1/players', player: @player
  end
end