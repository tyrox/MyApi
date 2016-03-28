json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :state
  json.url product_url(product, format: :json)
end
