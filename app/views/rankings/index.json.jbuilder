json.array!(@rankings) do |ranking|
  json.extract! ranking, :id, :stance_id, :category, :useful_ranking, :useful_justification, :trustworthy_ranking, :trustworthy_justification, :accurate_ranking, :accurate_justification, :interesting_ranking, :interesting_justification
  json.url ranking_url(ranking, format: :json)
end
