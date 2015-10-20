class UsersController < ApplicationController
  
  # index action
  def index
    @users = User.all
  end

  # show action
  def show
    @user = User.find params[:id]
    @posts = @user.posts
  end

  # create action
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url
      else
        redirect_to signup_url
    end
  end
  

  # show action
  def new
    @user = User.new
  end

  # edit action
  def edit
    @user = User.find params[:id]
  end

  # update action
  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    redirect_to edit_user_path
  end

  # destroy action
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end

  

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 


end

