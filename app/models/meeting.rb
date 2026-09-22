class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :held_on, presence: true
  validates :location, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
