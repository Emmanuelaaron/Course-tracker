class SessionsController < ApplicationController
  before_action :session_params, only: [:create]
  def new; end

  def create
    @user = User.find_by(username: @username)
    if @user
      session[:user_id] = @user.id
      redirect_to '/profile'
    else
      redirect_to '/login', notice: 'User does not exist!'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You are successful logged out!'
    redirect_to login_path
  end

  def login; end

  def profile; end

  private

  def session_params
    @username = params[:username]
  end
end
