class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      render json: session[:user_id], status: 201
    else
      render json: {"text" => 'Incorrect email and password combination'}, status: 400
    end
  end

  def destroy
    # binding.pry
    session[:user_id] = nil
    render text: 'logged out', status: 204
  end
end