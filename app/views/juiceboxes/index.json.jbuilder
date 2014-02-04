json.array!(@juiceboxes) do |juicebox|
  json.extract! juicebox, :id
  json.url juicebox_url(juicebox, format: :json)
end
