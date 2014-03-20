class IngredientsController < ApplicationController
  before_action :authenticated!, :set_user, :authorized!

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      @user.ingredients << ingredient

      render json: ingredient, status: 200
    else
      render json: ingredient, status: :unprocessable_entity
    end
  end

  private 

  def ingredient_params
    params.require(:ingredient).permit(:name, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end