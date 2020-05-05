class Player < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongd_to :user
end
