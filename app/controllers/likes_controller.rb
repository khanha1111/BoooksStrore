class LikesController < ApplicationController
  def create
    if active_like=Like.new(target_id:params[:id],target_type:"Activity",user_id:current_user.id).save
      @user =User.find(params[:user_id])
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    active_like=Like.where(target_id:params[:id],user_id:current_user.id).first.destroy
    @user =User.find(params[:user_id])
    respond_to do |format|
      format.js
    end
  end
end
