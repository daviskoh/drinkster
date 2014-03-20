class UsersController < ApplicationController
  before_action :authenticated!, :set_user, :authorized!, except: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: secure_user.as_json, status: 201
    else
      render status: :unprocessable_entity
    end
  end

  def show
    render json: secure_user, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      return render text: 'not authorized', status: :unauthorized
    end
  end

  def secure_user
    {id: @user.id, email: @user.email}
  end
end