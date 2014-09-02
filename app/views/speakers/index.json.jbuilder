json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :talks
  json.url speaker_url(speaker, format: :json)
end
