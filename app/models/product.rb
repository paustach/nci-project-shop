class Product < ApplicationRecord
    validates_presence_of :productName, :price, :image
    mount_uploader :image, PhotoUploader
    has_many :orderables
    has_many :carts, through: :orderables
end
