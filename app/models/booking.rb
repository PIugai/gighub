class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :band
  validates :date, presence: true
  validates :user_id, presence: true
  validates :band_id, presence: true
end
