json.array!(@contacts) do |contact|
  json.extract! contact, :id, :address, :latitude, :longitude
  json.url contact_url(contact, format: :json)
end
