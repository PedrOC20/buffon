json.data do
  json.array! @players do |player|
    json.partial: 'api/v1/players/contact', player: player
  end
end
