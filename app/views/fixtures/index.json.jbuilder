json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :hometeam_id, :awayteam_id, :date, :scrapper_id, :competition_id
  json.url fixture_url(fixture, format: :json)
end
