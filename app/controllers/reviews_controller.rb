class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    # book_id because of nested route
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    # book_id because of nested route
    @book = Book.find(params[:book_id])
     # build sets the book foreign key automatically
    @review = @book.reviews.build(create_update_params)
    @review.review_author = current_user.review_author
    if @review.save
      flash[:notice] = 'Review successfully created.'
      redirect_to(book_path(@book))
    else
      flash[:alert] = 'Failure to create new review.'
      render :new, status: :unprocessable_entity
      # redirect_to(new_book_review_path(@book))
    end
  end

  private
  def create_update_params
    params.require(:review).permit(:stars, :review)
  end
end
