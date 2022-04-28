class Destination < ApplicationRecord
  belongs_to :user

  # validations
  validates :name, :address, :description, :rate, :photo_url, presence: true
  validates :name, uniqueness: true
end
