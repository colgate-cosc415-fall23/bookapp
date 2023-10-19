class Book < ApplicationRecord
  validates :title, presence: true

  def self.title_search(string)
    Book.where("title like ?", "%#{string}%")
  end
end
