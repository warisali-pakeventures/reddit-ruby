module SessionHelper
  def is_user_not_logged_in?
    session[:userid].nil?
  end

  def is_user_logged_in?
    !is_user_not_logged_in?
  end

  def create_session(userid)
    session[:userid] = userid
  end

  def logged_in_user
    User.find session[:userid] if session[:userid]
  end

  def log_user_out
    session.delete(:userid)
  end
end

