class Flight < ApplicationRecord
  belongs_to :depart_id, class_name: "Airport"
  belongs_to :arrive_id, class_name: "Airport"
  belongs_to :airline
end
