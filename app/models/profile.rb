class Profile < ApplicationRecord
    belongs_to :user, :optional => true
    validates_presence_of :firstName, :lastName, :addressLine1, :postCode, :city, :phoneNumber
end
