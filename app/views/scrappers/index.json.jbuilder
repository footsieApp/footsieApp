json.array!(@scrappers) do |scrapper|
  json.extract! scrapper, :id, :name, :url
  json.url scrapper_url(scrapper, format: :json)
end
