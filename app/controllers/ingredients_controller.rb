class IngredientsController < ApplicationController
  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      current_user.ingredients << ingredient
      
      render json: ingredient, status: 200
    else
      render json: ingredient, status: :unprocessable_entity
    end
  end

  private 

  def ingredient_params
    params.require(:ingredient).permit(:name, :user_id)
  end
end