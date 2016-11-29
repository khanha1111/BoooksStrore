class RatingsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def create
		book=Book.find(params[:book_id])
		avg=(book.rating.to_f+params[:rating].to_f)
		r_count=avg_rating book.id
		avg=avg/r_count
		book.update_attribute(:rating,avg)
		Activity.create(user_id:current_user.id,action:"Rating",target_id:book.id,target_type:"Book")
		@book =Book.find(book.id)
		@rating=@book.rating
		respond_to do |format|
			format.js
		end
	end

end
