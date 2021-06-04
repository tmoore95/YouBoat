class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :name, presence: true, length: { minimum: 3,
  too_short: "name must be at least 3 characters long" }
  validates :location, presence: true
  validates :craft_type, presence: true
  validates :price_per_day, presence: true, numericality: { only_float: true }
  has_one_attached :photo
  # GEOCODED BY LOCATION
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # SEARCH STUFF
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :craft_type ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end

  
