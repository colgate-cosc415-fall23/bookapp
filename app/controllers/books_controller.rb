class BooksController < ApplicationController
  def index
    searchfield = params[:title_search]
    @books = if params[:title_search]
      Book.title_search(searchfield)
    else
      Book.all.order(:title) # order(title: :desc)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_update_params)
    if @book.save
      flash[:notice] = "#{@book.title} successfully created"
      redirect_to books_path and return
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(create_update_params)
      flash[:notice] = "#{@book.title} successfully updated"
      redirect_to book_path(@book) and return
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:alert] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

  private
  def create_update_params
    params.require(:book).permit(:title, :publisher, :year, :pages, :list_price)
  end

end
