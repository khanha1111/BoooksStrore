class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @review = params[:comment][:target_id]
    if @comment.save
      respond_to do |format|
        format.html {redirect_to @review}
        format.js
      end
    else
      flash[:info] = "Error for Create!"
    end
  end

  def show
    @comment=comment_load
    @reviews=@comment.review
  end

  def update

  end

  def edit

  end

  def destroy
    comment_load.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:target_id,:content,:parent_id).merge!(user_id:current_user.id,target_type:"Review")
  end

  def comment_load
    comment = Comment.find(params[:id])
  end
end
