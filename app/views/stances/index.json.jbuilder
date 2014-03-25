json.array!(@stances) do |stance|
  json.extract! stance, :id, :participant_id, :supporting, :statement
  json.url stance_url(stance, format: :json)
end
