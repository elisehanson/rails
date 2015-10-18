class UsersController < ApplicationController
  
  # index action
  def index
    @users = User.all
  end

  # show action
  def show
    @user = User.find params[:id]
  end

  # create action
  def create
    @user = User.create params[:user]
    redirect_to @user
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



end

