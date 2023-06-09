require './book'
require './person'
require './rental'
require './teacher'
require './student'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Method to list all books
  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Method to list all people
  def list_people
    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  # Method to create a person
  def create_person
    puts 'Enter name:'
    name = gets.chomp
    puts 'Enter age:'
    age = gets.chomp.to_i
    puts 'Enter student (1) or teacher (2):'
    type = gets.chomp.downcase
    if type == '1'
      puts 'Enter grade:'
      grade = gets.chomp
      @people << Student.new(age, name, grade)
    elsif type == '2'
      puts 'Enter specialization:'
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)
    else
      puts 'Invalid type. Please enter 1 or 2.'
    end
    puts 'Person created successfully!'
  end

  # Method to create a book
  def create_book
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  # Method to create a rental
  def create_rental
    puts 'Enter person id:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    puts 'Enter book title:'
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts 'Book not found.'
      return
    end

    puts 'Enter date rented (yyyy-mm-dd):'
    rented_at = gets.chomp
    @rentals << Rental.new(book, person, rented_at)
    puts 'Rental created successfully'
  end

  # Method to list all rentals for a given person id
  def list_rentals_for_person
    puts 'Enter person id:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end

    rentals = @rentals.select { |r| r.person == person }
    if rentals.empty?
      puts "No rentals found for #{person.name}."
      return
    end

    rentals.each do |rental|
      puts "#{rental.book.title} rented on #{rental.date}."
    end
  end
end
