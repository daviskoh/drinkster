class Drink < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :components
  has_many :ingredients, through: :components

  def component_list
    self.ingredients.each_with_object([]) do |ing, list|
      list << {name: ing.name, parts: ing.parts_of(self)}
    end
  end
end