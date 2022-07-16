class Product < ApplicationRecord
    validates_presence_of :productName, :price, :image
end
