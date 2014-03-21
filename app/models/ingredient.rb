class Ingredient < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :users

  has_and_belongs_to_many :drinks

  def self.exist?(ingredientName)
    Ingredient.find_by(name: ingredientName) ? true : false
  end
end