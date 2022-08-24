class Dragon < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, :power, :level, :age, :price, presence: true
end
