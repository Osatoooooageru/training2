json.extract! tweet, :id, :video, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
