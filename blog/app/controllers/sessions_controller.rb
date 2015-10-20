class SessionsController < ApplicationController

	def new
		@users = User.all
	end



  def create
    puts params[:email]
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	flash[:notice] = "You've been logged in."
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_path
      flash[:alert] = "There was a problem logging you in."
    end 
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end 



# def create
# 	puts params.inspect
# #try to authenticate the user - if they authenticate successfully, an instance of the User model is returned
# @user = User.authenticate(params[:email], params[:password])
# #if an instance is returned and @user is not nil...
# if @user
# #let the user know they've been logged in with a flash message
# flash[:notice] = "You've been logged in."
# #THIS IS THE MOST IMPORTANT PART. Actually log the user in by storing their ID in the session hash with the [:user_id] key!
# session[:user_id] = @user.id
# #then redirect them to the homepage
# # redirect_to "/home"
# else
# #whoops, either the user wasn't in the database or their password is incorrect, so let them know, then redirect them back to the log in page
# flash[:alert] = "There was a problem logging you in."
# redirect_to login_path
# end
# end


# 	def create
#   user = User.find_by(email: params[:session][:email].downcase)
#   if user && user.authenticate(params[:session][:password])
#   	session[:user_id] = @user_id
#     sign_in user
#   else
#     flash.now[:error] = 'Invalid email/password combination'
#     render 'new'
#   end
# end

	# def destroy
	# 	log_out
 #    	redirect_to root_url
	# end

end
