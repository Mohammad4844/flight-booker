class Airport < ApplicationRecord
  has_many :departs, class_name: "Flight", foreign_key: "depart_id"
  has_many :arrives, class_name: "Flight", foreign_key: "arrive_id"

  validates :code, presence: true, uniqueness: true, length: { is: 3 }, format: { with: /\A[A-Z]+\z/, message: "only allows uppercase letters" }
  validates :name, presence: true, length: { maximum: 100 }
end
