Given('I am on the books page') do
  visit books_path
end
  
When('I fill in {string} with {string}') do |formentry, value|
    fill_in formentry, with: value
end
  
When('I press {string}') do |button|
    click_on button
end
  
Then('I should be on the books page') do
    expect(page.current_path).to eq(books_path)
end
  
Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Given(/^these Books:$/) do |table| # table is a Cucumber::Ast::Table  
  table.hashes.each do |h|
    Book.create!(h)
  end
end

Then('I should not see {string}') do |string|
    expect(page).not_to have_content(string)
end

