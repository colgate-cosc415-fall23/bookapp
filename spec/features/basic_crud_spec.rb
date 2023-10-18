require 'rails_helper'

RSpec.feature "BasicCruds", type: :feature do
  before :each do
    @b1 = Book.create!(title: "one")
    @b2 = Book.create!(title: "two")
    @b3 = Book.create!(title: "three")
  end

  describe "index route" do
    it "should route and render correctly" do
      visit books_path
      expect(page.current_path).to eq(books_path)
      expect(page).to have_content(/one/)
      expect(page).to have_content(/two/)
      expect(page).to have_content(/three/)
    end
  end

  describe "show route" do
  end

  describe "new/create happy path" do
  end
  
  describe "edit/update happy path" do
  end
end
