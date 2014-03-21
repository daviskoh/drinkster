class IngredientsController < ApplicationController
  before_action :authenticated!, :set_user, :authorized!
  before_action :set_ingredient, only: [:create]

  def index
    render json: @user.ingredients.order(name: :asc), status: 200
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if @ingredient
      @user.ingredients << @ingredient
      render json: @ingredient, status: 200
    elsif ingredient.save 
      @user.ingredients << ingredient  
      render json: ingredient, status: 200
    else
      render text: 'unprocessable entity', status: :unprocessable_entity
    end
  end

  def destroy
    # NOTE: hitting destroy action will NOT remove ingredient from db
    ingredient = Ingredient.find(params[:id])

    if @user.ingredients.delete(ingredient)
      render json: ingredient, status: 200
    else
      render status: 500
    end
  end

  private 

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find_by(name: params[:ingredient][:name])
  end
end