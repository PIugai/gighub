class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :style, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true
  acts_as_taggable_on :tags
end
