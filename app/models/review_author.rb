class ReviewAuthor < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews

end
