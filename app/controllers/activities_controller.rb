class ActivitiesController < ApplicationController
  def create
    key=params[:key]
    book_id=params[:book_id]
    activity=Activity.create(action:key,target_id:book_id,target_type:"Book",user_id:current_user.id)
  end

  def actives_log
    @hash_select=[{:value=>"Filter by Reading", :key=>"Reading"},{:value=>"Filter by Readed",:key=>"Readed"},{:value=>"Filter by Favorite",:key=>"Favorite"}]
  end

  def find_log
    condition="%#{params[:log][:condition]}%"
    @logs=Activity.where("action like ? ",condition).paginate(page: params[:page],per_page: 10)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    activity = Activity.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end

end
