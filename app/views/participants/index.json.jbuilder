json.array!(@participants) do |participant|
  json.extract! participant, :id, :session_id, :ip_address, :first_name, :last_name, :instructor, :email
  json.url participant_url(participant, format: :json)
end
