class Listing < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 5,
  too_short: "name must be at least 5 characters long" }
  validates :location, presence: true
  validates :craft_type, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
end
