class DrinksController < ApplicationController
  before_action :authenticated!, :set_user

  def index
    
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end