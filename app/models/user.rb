# frozen_string_literal: true

# User model for
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :players, dependent: :destroy
  has_many :comments, dependent: :destroy
end
