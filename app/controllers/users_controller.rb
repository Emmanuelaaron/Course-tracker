class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/profile', notice: 'Sucessfully signed up'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
