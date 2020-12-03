class BookingValidator < ActiveModel::Validator
  def validate(record)
    # return unless record.user == record.user
    if record.offer && record.user == record.offer.user
      record.errors[:offer] << "Can't be user and guide simultaneously"
    elsif record.date_start && record.date_start < Time.now
      record.errors[:date_start] << "Start day must be in the future"
    elsif record.date_end && record.date_end < record.date_start
      record.errors[:date_start] << "End day must be greater then start day"
    end
  end
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  # Deve ter um user, uma oferta, uma data de início e uma data de fim
  validates :date_start, :date_end, presence: true
  validates_with BookingValidator
end
