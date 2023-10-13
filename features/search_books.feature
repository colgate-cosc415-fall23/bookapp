Feature: Customer can search for books by title
  As a book store customer,
  So that I can easily find a book I'm looking for,
  I want to search for books by title

Background: the book store has several books
  Given these Books:
    | title               | list_price | year |
    | communist manifesto | 3.49       | 1848 |
    | agile manifesto     | 13.49      | 2000 |
    | How to write one song | 19.99      | 2021 |
    | ESaaS               | 35.99      | 2013 |

# >= 1 scenario per feature
Scenario: Search for a book by title
  Given I am on the books page
  When I fill in "Title search" with "manifesto"
  And I press "Search"
  Then I should be on the books page
  And I should see "manifesto"
  And I should not see "ESaaS"
  And I should not see "How to write one song"
  # 3-8 steps per scenario
