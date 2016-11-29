class ReviewsController < ApplicationController
	def index
		@reviews =Review.paginate(page: params[:page],per_page: 5)
	end

	def update
		@book = review_load.book
		if review_load.update_attributes(params_update)
			flash[:success] = "Success for Update!"
      redirect_to @book
    else
			flash[:success] = "Error for Update!"
      redirect_to :back
    end
	end

	def edit
		@review=review_load
	end
	def create
		@review = Review.new(review_params)
		if @review.save
			flash[:success] = "Success for Create!"
			book=Book.find(@review.book_id)
			redirect_to book
		else
			flash[:info] = "Error for Create!"
			render 'new'
		end
	end

	def show
		@review=Review.find(params[:id])
		@comments = @review.comments
	end

	def new
		@book_id=params[:book_id]
	end

	def destroy
		@book= Book.find(review_load.book_id)
		review_load.destroy
		flash[:success] = "Delete success!"
		redirect_to @book
	end


	private
	def review_params
		params.require(:review).permit(:title,:content,:book_id,:user_id)
	end
	def params_update
		params.require(:review).permit(:title,:content)
	end
	def review_load
		review = Review.find(params[:id])
	end
end
