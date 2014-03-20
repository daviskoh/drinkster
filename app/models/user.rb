class User < ActiveRecord::Base
  validates :email, :password, presence: true
  # validates :email, uniqueness: true

  has_and_belongs_to_many :ingredients

  has_secure_password
end