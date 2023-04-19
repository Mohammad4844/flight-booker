class Flight < ApplicationRecord
  belongs_to :depart, class_name: "Airport"
  belongs_to :arrive, class_name: "Airport"
  belongs_to :airline
end
