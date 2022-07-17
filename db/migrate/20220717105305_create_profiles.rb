class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :addressLine1
      t.string :addressLine2
      t.string :postCode
      t.string :city
      t.string :phoneNumber

      t.timestamps
    end
  end
end
