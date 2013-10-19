json.array!(@user_tokens) do |user_token|
  json.extract! user_token, :provider, :uid, :user_id
  json.url user_token_url(user_token, format: :json)
end
