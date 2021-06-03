class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :content, presence: true
end