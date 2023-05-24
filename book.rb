class Book
 
end

class Person
  attr_accessor :name, :age, :rentals

  def initialize(name, age)
    @name = name
    @age = age
    @rentals = []
  end
end
