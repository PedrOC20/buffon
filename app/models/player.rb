class Player < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :evaluation, dependent: :destroy
  validates :player_type, inclusion: { in: ['Clients', 'Hitlist'],
    message: "%{value} is not a valid type" }, presence: true
end
