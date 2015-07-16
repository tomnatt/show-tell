json.array!(@talks) do |talk|
  json.extract! talk, :id
  json.url talk_url(talk, format: :json)
end
