class BooksController < ApplicationController
  def index
    @books = Book.all.order(:title) # order(title: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end
end
