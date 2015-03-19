json.array!(@competitions) do |competition|
  json.extract! competition, :id, :name
  json.url competition_url(competition, format: :json)
end
