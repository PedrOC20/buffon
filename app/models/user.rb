# frozen_string_literal: true

# User model for
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :comments
  has_many :evaluations
  has_many :club_requests
  has_many :contacts
  scope :active, ->{ where(active: true) }

  def generate_jwt
    JWT.encode({id: self.id, is_admin: self.is_admin?, exp: 30.days.from_now.to_i}, Rails.application.credentials.secret_key_base)
  end

  def is_admin?
    self.admin?
  end

  def is_active?
    self.active?
  end
end
