class SessionsController < ApplicationController

	def new

	end



# user = User.find_by(email: params[:session][:email].downcase)
#   if user && user.authenticate(params[:session][:password])


	# def create
	# 	puts params.inspect
 #   	 	@user = User.find_by(email: params[:session][:email])
 #    		if @user and @user.password == params[:password]
 #    		session[:user_id] = @user_id
 #    		flash[:notice] = 'yay'
 #      		log_in user
 #      		redirect_to @user_id
 #  		else
 #      		# Create an error message.
 #      		flash[:alert] = 'Invalid email/password combination'
 #      		render :new
 #    	end
	# end


def create
	puts params.inspect
#try to authenticate the user - if they authenticate successfully, an instance of the User model is returned
@user = User.authenticate(params[:email], params[:password])
#if an instance is returned and @user is not nil...
if @user
#let the user know they've been logged in with a flash message
flash[:notice] = "You've been logged in."
#THIS IS THE MOST IMPORTANT PART. Actually log the user in by storing their ID in the session hash with the [:user_id] key!
session[:user_id] = @user.id
#then redirect them to the homepage
# redirect_to "/home"
else
#whoops, either the user wasn't in the database or their password is incorrect, so let them know, then redirect them back to the log in page
flash[:alert] = "There was a problem logging you in."
redirect_to login_path
end
end


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

	def destroy
		log_out
    	redirect_to root_url
	end

end
