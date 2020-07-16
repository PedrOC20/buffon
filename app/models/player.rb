class Player < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :evaluation, dependent: :destroy
  validates :player_type, inclusion: { in: ['Client', 'Hitlist'],
    message: "%{value} is not a valid type" }, presence: true
  has_one_attached :photo
end
