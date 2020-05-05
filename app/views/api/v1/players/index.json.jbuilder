require 'byebug'

json.data do
  json.array! @players do |player|
    json.partial 'api/v1/players', player: player
  end
end
