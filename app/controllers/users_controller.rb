class UsersController < ApplicationController
  
  def login
    @user = User.new  
  end
  
  def new
    @user = User.new
  end

  # show all ads for user and options to change users profile
  def show
    @user = User.find(params[:id])
    @ads = @user.ads.all
  end
  
  def create
   user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
