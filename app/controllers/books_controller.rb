class BooksController < ApplicationController
  def index
    @books = Book.all.order(:title) # order(title: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params)
    if @book.save
      redirect_to books_path and return
    else
      render 'new'
    end
  end

  private
  def create_params
    params.require(:book).permit(:title, :publisher, :year, :pages, :list_price)
  end

end
