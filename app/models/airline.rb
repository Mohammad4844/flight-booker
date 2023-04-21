class Airline < ApplicationRecord
  has_many :flights

  validates :code, presence: true, uniqueness: true, length: { is: 2 }, format: { with: /\A[A-Z]+\z/, message: "only allows uppercase letters" }
  validates :name, presence: true, length: { maximum: 100 }  
end
