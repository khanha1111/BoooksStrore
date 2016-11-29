class RequestsController < ApplicationController
  def index
    @requests = Request.where(user_id:current_user.id).order("status asc").paginate(page: params[:page],per_page: Settings.ten)
  end

  def create
    status=params[:request][:status]
    if status.nil?
      request = Request.new(request_params)
      if request.save
        flash[:success] = t("success_create")
        redirect_to root_url
      else
        flash[:info] = t("error_create")
        render :new
      end
    else
      category_id=params[:request][:cate_name]
      if category_id==""
        request=request_load
        category=compare_catetegory request.cate_name
        approve_request request,category
      else
        category=Category.find_by_id(category_id)
        request=Request.find_by_id(params[:request][:id])
        approve_request request,category
      end
    end
  end

  def destroy
    request_load.destroy
    flash[:success] = t("delete_success")
    redirect_to :back
  end

  private
  def request_params
    params.require(:request).permit(:cate_name,:title,:publish_date,:author,:num_of_page,:image).merge! user_id:current_user.id
  end
  def request_load
    request = Request.find(params[:id])
  end

  def approve_request request, category
    book=Book.new(category_id:category.id,title:request.title,publish_date:request.publish_date,author:request.author,num_of_page:request.num_of_page,rating:0)
    if book.save
      flash[:success] = t("success_approve")
      redirect_to :back
    else
      flash[:success] = t("error_approve")
      redirect_to :back
    end
  end

  #Compare category name function
  def compare_catetegory category_name
    condition="%#{category_name}%"
    category=Category.where("name like ? ",condition).first
    if category.nil?
      category=Category.create name:category_name
    end
    return category
  end
end
