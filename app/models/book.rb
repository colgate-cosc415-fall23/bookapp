class Book < ApplicationRecord
  def self.title_search(string)
    Book.where("title like ?", "%#{string}%")
  end
end
