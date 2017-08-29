json.extract! prodact, :id, :name, :decription, :price, :quantity, :item_id, :created_at, :updated_at
json.url prodact_url(prodact, format: :json)
