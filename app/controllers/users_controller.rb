class UsersController < ApplicationController
	def new

	end

	def create
		@user = User.new(user_params)
		if @user.save
			user_login @user
			flash[:success] = "Success for Sign up."
			redirect_to root_url
		else
			flash[:info] = "Please Sign up again!"
			render 'new'
		end
	end

	def edit

	end

	def destroy
		user_load.destroy
		flash[:success] = "Success for Delete."
		redirect_to books_path
	end

	def update

	end

	def index
		@users=User.paginate(page: params[:page],per_page: 8)
	end

	def show
		@user=user_load
		# @logs=@user.activities
	end


	private
	def user_params
		params.require(:user).permit(:email,:fullname,:password,:password_confirmation)
	end
	def user_load
    user = User.find(params[:id])
  end

end
