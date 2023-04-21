class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  accepts_nested_attributes_for :passengers

  validate :passengers_count

  def passengers_count
    if passengers.size < 1
      errors.add(:base, "At least one passenger is required.")
    elsif passengers.size > 4
      errors.add(:base, "At most four passengers are allowed.")
    end
  end
end
