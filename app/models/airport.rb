class Airport < ApplicationRecord
  has_many :departs, class_name: "Flight", foreign_key: "depart_id"
  has_many :arrives, class_name: "Flight", foreign_key: "arrive_id"
end
