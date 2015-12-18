json.array!(@technologies) do |technology|
  json.extract! technology, :id, :name, :description, :link, :doc
  json.url technology_url(technology, format: :json)
end
