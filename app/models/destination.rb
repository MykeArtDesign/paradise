class Destination < ApplicationRecord
  belongs_to :user

  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validations
  validates :name, :address, :description, :rate, :photo_url, presence: true
  validates :name, uniqueness: true
end
