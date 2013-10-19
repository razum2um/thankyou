json.array!(@cards) do |card|
  json.extract! card, :greeting, :message, :user_id
  json.url card_url(card, format: :json)
end
