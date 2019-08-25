json.array! @trades do | trade |
  json.id         trade.id
  json.name       trade.product.name
  json.image      url_for(trade.product.images.first)
  json.created_at time_ago_in_words(trade.created_at)
end