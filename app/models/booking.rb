class Booking < ApplicationRecord
  belongs_to :dragon
  belongs_to :user
end
