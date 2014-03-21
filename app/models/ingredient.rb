class Ingredient < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :users

  has_many :components
  has_many :drinks, through: :components

  def self.exist?(ingredientName)
    Ingredient.find_by(name: ingredientName) ? true : false
  end

  def parts_of(drink)
    Component.find_by(drink_id: drink.id, ingredient_id: self.id).parts
  end
end