class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :productID
      t.string :productName
      t.integer :categoryID
      t.string :categoryName
      t.decimal :price
      t.string :size
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
