require 'rails_helper'

RSpec.describe Book, type: :model do
  context "title search" do
    it "should select any matching book by title" do
      b1 = Book.create!(title: "book one")
      b2 = Book.create!(title: "book two")
      expect(Book.title_search("book")).to eq([b1,b2])
      expect(Book.title_search("one")).to eq([b1])
      expect(Book.title_search("two")).to eq([b2])
      expect(Book.title_search("three")).to eq([])
    end
  end
end
