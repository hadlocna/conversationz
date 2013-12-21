module ControllerHelper

  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find(session[:current_user_id])
  end

  def current_user_assign(user)
    session[:current_user_id] = user.id
  end

  def logout_user
    session[:current_user_id] = nil
  end

end
