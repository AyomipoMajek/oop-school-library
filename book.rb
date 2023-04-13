class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, person, self)
    person.rentals << rental
    @rentals << rental
  end
end

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end
end

class Person
  attr_accessor :name, :age, :rentals

  def initialize(name, age)
    @name = name
    @age = age
    @rentals = []
  end
end
