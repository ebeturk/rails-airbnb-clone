class Dragon < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :name, :power, :level, :age, :price, presence: true

end
