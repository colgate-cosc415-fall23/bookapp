class Review < ApplicationRecord
  belongs_to :book
  belongs_to :review_author

  validates :stars, numericality: {only_integer: true, in: 1..5}
end
