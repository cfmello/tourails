class BookingValidator < ActiveModel::Validator
  def validate(record)
    if record.offer && record.user == record.offer.user
      record.errors[:special_request] << "Este serviço é ofertado por você"
    elsif record.date_start && record.date_start < Time.now
      record.errors[:date_start] << "Tente usar uma data futura"
    elsif record.date_end && record.date_end < record.date_start
      record.errors[:date_end] << "Use uma data posterior a data de início"
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
