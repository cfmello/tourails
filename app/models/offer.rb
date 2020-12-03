class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :city, presence: true
end
