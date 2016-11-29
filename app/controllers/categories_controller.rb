class CategoriesController < ApplicationController
  before_action :category_load, only: [:index, :edit, :update, :destroy ]

  def index
    @categories = Category.paginate(page: params[:page], per_page: Settings.ten)
  end
  def show
  end

  def new
  end

  def create
    category = Category.new(cate_params)
    if category.save
      flash[:success] =  t "success_create"
      redirect_to categories_path
    else
      flash[:error] = t "success_create"
      render :new
    end
  end

  def edit
    @category = category_load
  end

  def update
    category = category_load
    if category.update_attributes(category_params)
      flash[:success] =  t "update_success"
      redirect_to categories_path
    else
      flash[:error] = t "update_error"
      render :back
    end
  end

  def destroy
    category_load.destroy
    flash[:success] = t "delete_success"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def category_load
    category = Category.find params[:id]
  end
end
