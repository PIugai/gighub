class User < ApplicationRecord
  has_many :bands
  has_many :bookings
end
