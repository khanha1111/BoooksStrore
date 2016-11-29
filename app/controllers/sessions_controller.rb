class SessionsController < ApplicationController
	def new

	end

	def create
		user=User.find_by(email:params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#init session
			user_login user
			flash[:success] = "Welcome #{user.fullname}!"
			redirect_to root_url
		else
			flash[:danger] = "Username or Passwored not valid!"
			render 'new'
		end  	
	end

	def destroy
		log_out
		flash[:success] = "You are Logout!"
		redirect_to root_url
	end
end
