class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to '/welcome'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
