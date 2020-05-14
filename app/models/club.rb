class Club < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :club_requests, dependent: :destroy
end
