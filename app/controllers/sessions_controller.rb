class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to '/profile'
    else
      redirect_to '/login'
    end
  end

  def login; end

  def profile; end
end
