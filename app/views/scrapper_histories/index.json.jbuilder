json.array!(@scrapper_histories) do |scrapper_history|
  json.extract! scrapper_history, :id, :name, :url
  json.url scrapper_history_url(scrapper_history, format: :json)
end
