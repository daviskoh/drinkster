module SessionsHelper
  def logged_in?
    session[:user_id].present?
  end

  def authenticated!
    unless logged_in?
      return render text: 'not authorized', status: 401
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      return render text: 'not authorized', status: :unauthorized
    end
  end
end