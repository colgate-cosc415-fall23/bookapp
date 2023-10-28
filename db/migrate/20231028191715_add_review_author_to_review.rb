class AddReviewAuthorToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :review_author, null: false, foreign_key: true
  end
end
