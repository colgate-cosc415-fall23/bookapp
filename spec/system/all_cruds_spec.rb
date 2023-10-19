require 'rails_helper'

RSpec.describe "AllCruds", type: :system do
  before do
    driven_by(:rack_test)
  end

  before :each do
    @b1 = Book.create!(title: "one", list_price: 9.99)
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
    it "should route and render correctly" do
      visit books_path
      click_on "one"
      expect(page.current_path).to eq(book_path(@b1))
      expect(page).to have_content(/one/)
    end
  end

  describe "new/create" do
    it "happy path" do
      visit books_path
      click_on "Create new book"
      fill_in "Title", with: "Hitchhikers guide to the galaxy"
      fill_in "Publisher", with: "Somebody"
      fill_in "Year", with: "1979"
      fill_in "Pages", with: "250"
      fill_in "List price", with: "9.99"
      click_on "Create Book"
      expect(page.current_path).to eq(books_path)
      expect(page).to have_content("Hitchhikers guide to the galaxy successfully created")
    end

    it "sad path" do
      visit books_path
      click_on "Create new book"
      fill_in "List price", with: 9.99

      b = Book.new
      expect(Book).to receive(:new) { b }
      expect(b).to receive(:save) { nil }

      click_on "Create Book"
      expect(page.current_path).to eq(books_path).or eq(new_book_path)
      expect(page).to have_content(/Creation failed/)
    end
  end
  
  describe "edit/update" do
    it "happy path" do
      visit book_path(@b1)
      expect(page).to have_content("$9.99")
      click_on "Edit book"
      fill_in "List price", with: 29.99
      click_on "Update Book"
      expect(page).to have_current_path(book_path(@b1))
      expect(page).to have_content("$29.99")
    end

    it "sad path" do 
      visit book_path(@b1)
      expect(page).to have_content("$9.99")
      click_on "Edit book"
      b = Book.find(@b1.id)
      expect(Book).to receive(:find).with("#{@b1.id}").and_return(b)
      expect(b).to receive(:update) { nil }
      fill_in "Title", with: ""
      fill_in "List price", with: 29.99
      click_on "Update Book"
      expect(page.current_path).to eq(book_path(@b1)).or eq(edit_book_path(@b1))
      expect(page).to have_content(/Update failed/)
    end
  end

  describe "delete/destroy" do
    it "should successfully delete" do
      visit books_path
      click_on "one"
      expect(page.current_path).to eq(book_path(@b1))
      click_on "Delete book"
      expect(page.current_path).to eq(books_path)
      expect(page).to have_content("Book 'one' deleted")
    end
  end
end
