class BooksController < ApplicationController
  before_action :book_load, only: [:index, :edit, :update, :destroy ]

  def index
    @books=Book.paginate page: params[:page],per_page: Settings.ten
  end

  def show
    @book=book_load
    @reviews=@book.review
    @rating=@book.rating
  end

  def new
    @categories=Category.all
  end

  def create
    book = Book.new book_params
    if book.save
      flash[:success] = t "success_create"
      redirect_to books_path
    else
      flash[:info] = t "error_create"
      render "new"
    end
  end

  def edit
    @book = book_load
  end

  def update
    book = book_load
    if book.update_attributes(book_params)
      flash[:success] = t "update_success"
      redirect_to books_path
    else
      flash[:error] = t "update_error"
      render :back
    end
  end

  def destroy
    book_load.destroy
    flash[:success] = t "delete_success"
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:publish_date,:author,:num_of_page,:category_id,:image,rating:0)
  end

  def book_load
    book = Book.find_by params[:id]
  end
end
