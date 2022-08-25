class Dragon < ApplicationRecord
  has_many :bookings
  has_many :reviews
  belongs_to :user
  has_one_attached :photo

  validates :name, :power, :level, :age, :price, presence: true

<<<<<<< HEAD


=======
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
>>>>>>> 0f230035e9aac7d4729fd1793e8ad549b3302262
end
