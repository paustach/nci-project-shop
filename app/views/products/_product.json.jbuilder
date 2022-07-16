json.extract! product, :id, :productID, :productName, :categoryID, :categoryName, :price, :size, :description, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
