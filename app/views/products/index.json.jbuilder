json.array! @category_children do |child|
  json.id child.id
  json.name child.name
  json.depth child.depth
end

json.array! @category_grandchildren do |child|
  json.id child.id
  json.name child.name
  json.depth child.depth
end