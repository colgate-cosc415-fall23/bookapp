User.create!(email: "admin@colgate.edu", password: "colgate13", admin: true)

b1 = Book.create!(title: "ESaaS, first edition", pages: 234, publisher: "Strawberry Canyon", year: 2015, list_price: 19.99)
b2 = Book.create!(title: "Moby Dick", pages: 999, publisher: "Unknown", year: 1830, list_price: 9.99)
b3 = Book.create!(title: "The Brothers Karamazov", pages: 1200, publisher: "Unknown", year: 1875, list_price: 12.99)
b4 = Book.create!(title: "Crime and Punishment", pages: 900, publisher: "Unknown", year: 1877, list_price: 10.99)
b5 = Book.create!(title: "What we owe to each other", pages: 432, publisher: "Belknap Press", year: 2000, list_price: 31.39)
b6 = Book.create!(title: "Let's go (so we can get back)", pages: 287, year: 2018, publisher: "Dutton", list_price: 19.19)
b7 = Book.create!(title: "The essential Calvin and Hobbes", pages: 255, year: 1988, publisher: "Andrew and McMeel Books", list_price: 13.13)

a1 = Author.create!(name: "Armando Fox", dob: Date.new(1950, 1, 1))
a2 = Author.create!(name: "Dave Patterson", dob: Date.new(1940, 1, 1))
b1.authors = [a1, a2]

a3 = Author.create!(name: "Herman Melville", dob: Date.new(1819, 8, 1), dod: Date.new(1891, 9, 28))
b2.authors << a3

a4 = Author.create!(name: "Fyodor Dostoyevsky", dob: Date.new(1821, 11, 11), dod: Date.new(1881, 2, 9))
b3.authors << a4
b4.authors << a4

a5 = Author.create!(name: "T.M. Scanlon", dob: Date.new(1940, 6, 28))
b5.authors << a5

a6 = Author.create!(name: "Jeff Tweedy", dob: Date.new(1967, 8, 25))
b6.authors << a6

a7 = Author.create!(name: "Bill Watterson", dob: Date.new(1958, 7, 5))
b7.authors << a7


blist = [b1, b2, b3, b4, b5, b6, b7]
rauthors = []
rauthors << ReviewAuthor.create!(name: "Brian Casey")
rauthors << ReviewAuthor.create!(name: "Lesleigh Cushing")
rauthors << ReviewAuthor.create!(name: "Paul McLoughlin")

1.upto(7) do |id|
    puts "Adding reviews to book #{id}"

    revtext = {
        1 => "terrible",
        2 => "not great",
        3 => "meh",
        4 => "pretty good",
        5 => "awesome",
    }

    num_reviews =rand(3)+2
    num_reviews.times do
        rtype = rand(5)+1
        rtext = revtext[rtype]
        r = Review.create(stars: rtype, review: "It was #{rtext}.")
        r.review_author = rauthors[rand(2)]
        r.book = Book.find(id)
        r.save!
    end
end
