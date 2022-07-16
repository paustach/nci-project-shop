class Product < ApplicationRecord
    validates_presence_of :productName, :price, :image
    mount_uploader :image, PhotoUploader
end
