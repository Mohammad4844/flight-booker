class Flight < ApplicationRecord
  belongs_to :depart, class_name: "Airport"
  belongs_to :arrive, class_name: "Airport"
  belongs_to :airline
  has_many :bookings


  validates :start_date_time, presence: true
  validates :duration_min, presence: true, numericality: { greater_than: 0 }
  
end
