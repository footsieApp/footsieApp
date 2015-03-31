json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :date
  json.url fixture_url(fixture, format: :json)
end
