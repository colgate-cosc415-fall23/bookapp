class ReviewsController < ApplicationController
  def new
    # book_id because of nested route
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    # book_id because of nested route
    @book = Book.find(params[:book_id])
     # build sets the book foreign key automatically
    @review = Review.new(create_update_params)
    @book.reviews << @review
    if @review.save
      flash[:notice] = 'Review successfully created.'
      redirect_to(book_path(@book))
    else
      flash[:notice] = 'Failure to create new review.'
      redirect_to(new_book_review_path(@book))
    end
  end

  private
  def create_update_params
    params.require(:review).permit(:stars, :description)
  end
end
