class HomeController < ApplicationController
  def index
  end

  # search action
  def search
    @users = User.where(email: params[:query])
  end
end
