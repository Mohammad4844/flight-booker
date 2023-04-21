class Passenger < ApplicationRecord
  belongs_to :booking

  validates :full_name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end

