json.array! @todo_list do | todo |
  json.id         todo.id
  json.title      todo.title
  json.image      url_for(todo.trade.product.images.first)
  json.created_at time_ago_in_words(todo.created_at)
end