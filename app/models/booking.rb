class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
