json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :github, :twitter, :url, :startdate, :enddate, :abstract
  json.url project_url(project, format: :json)
end
