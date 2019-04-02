class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :date, presence: true
end
