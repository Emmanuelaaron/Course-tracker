module SessionsHelper
  def current_user_logged_in?
    render 'loggedin' if logged_in?
  end

  def loggedin_user_profile
    if logged_in?
      render 'profile_content'
    else
      render 'welcome_page'
    end
  end
end
