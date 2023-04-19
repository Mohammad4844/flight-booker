class Airport < ApplicationRecord
  has_many :depart_id, class_name: "Flight", foreign_key: "depart_id"
  has_many :arrive_id, class_name: "Flight", foreign_key: "arrive_id"
end
