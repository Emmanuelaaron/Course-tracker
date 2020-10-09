module InternalprojectsHelper
  def current_user_logged_in?
    render 'loggedin' if logged_in?
  end
end
