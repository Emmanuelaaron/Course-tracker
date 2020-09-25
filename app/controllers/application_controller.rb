class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/profile' unless logged_in?
  end

  def total_days
    my_total = 0
    current_user.projects.each do |project|
      my_total += project.amount
    end
    my_total
  end
  
end
