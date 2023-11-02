class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :reviews

  validates :title, presence: true

  scope :pageorder, -> { order('pages DESC') }
  scope :with_pages, ->(min, max) { where('pages >= ? AND pages <= ?', min, max) }
  scope :living_writers, ->{ joins(:authors).where('dod is ?', nil).uniq }
  scope :with_good_reviews, ->(rating) { joins(:reviews).group(:book_id).having('AVG(stars) >= ?', rating) }
  scope :books_by, ->(name) { joins(:authors).where('name LIKE ?', "%#{name}%") }

  def self.title_search(string)
    Book.where("title like ?", "%#{string}%")
  end
end
