class Dragon < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  has_one_attached :photo

  validates :name, :power, :level, :age, :price, presence: true



end
