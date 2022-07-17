json.extract! profile, :id, :firstName, :lastName, :addressLine1, :addressLine2, :postCode, :city, :phoneNumber, :created_at, :updated_at
json.url profile_url(profile, format: :json)
