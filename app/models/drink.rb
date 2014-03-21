class Drink < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :components
  has_many :ingredients, through: :components
end