class IngredientsController < ApplicationController
  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      render json: ingredient.as_json(methods: :image_url), status: 200
    else
      render json: ingredient.errors, status: :unprocessable_entity
    end
  end

  private 

  def ingredient_params
    params.require(:ingredient).permit(:name, :user_id)
  end
end