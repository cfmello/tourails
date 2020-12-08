class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :city, presence: true

  include PgSearch::Model
  pg_search_scope :ominisearch,
                  against: %i[city description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
