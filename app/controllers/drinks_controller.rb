class DrinksController < ApplicationController
  before_action :authenticated!, :set_user

  def index
    render json: @user.drinks.as_json(methods: :ingredients), status: 200
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end