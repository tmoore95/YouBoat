class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  after_initialize :set_status

  def set_status
    self.status ||= "pending"
  end
end
