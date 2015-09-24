json.array!(@depenses) do |depense|
  json.extract! depense, :id, :title, :value, :date, :checked
  json.url depense_url(depense, format: :json)
end
