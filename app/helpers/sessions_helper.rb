module SessionsHelper
  def user_login user
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    end
  end

  def login?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def is_admin?
    return current_user.is_admin
  end
end
