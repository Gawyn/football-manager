module ApplicationHelper
  def current_user
    User.find(session[:user_id]) if session && session.has_key?(:user_id)
  end
end
