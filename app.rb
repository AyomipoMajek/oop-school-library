require './book'
require './person'
require './rental'
require './teacher'
require './student'
require 'json'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
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

    rentals = @rentals.select { |r| r.person.id == person_id }
    rentals.each do |rental|
      puts "Book Title: #{rental.book.title}, Author: #{rental.book.author}, Date Rented: #{rental.rented_at}"
    end
  end

  #Method to save data to JSON file
  def save_data
    data = {
      books: @books.map(&:to_hash),
      people: @people.map(&:to_hash),
      rentals: @rentals.map(&:to_hash)
    }
    File.write('data.json', JSON.pretty_generate(data))
    puts 'Data saved to data.json'
  end

  private

  #Method to load data from JSON file
  def load_data
    filename = 'data.json'
    return puts("Data file #{filename} not found. Starting with empty data.") unless File.exist?(filename)

    data = JSON.parse(File.read(filename), symbolize_names: true)
    @books = data[:books].map { |b| Book.new(b[:title], b[:author], b[:id]) }
    @people = data[:people].map { |p| create_person_from_data(p) }
    @rentals = data[:rentals].map { |r| create_rental_from_data(r) }
    puts "Data loaded successfully from #{filename}."
  end

  def create_person_from_data(data)
    case data[:type]
    when 'student' then Student.new(data[:age], data[:name], data[:grade], data[:id])
    when 'teacher' then Teacher.new(data[:age], data[:specialization], data[:name], data[:id])
    end
  end

  def create_rental_from_data(data)
    book = @books.find { |b| b.id == data[:book_id] }
    person = @people.find { |p| p.id == data[:person_id] }
    Rental.new(book, person, data[:rented_at])
  end
end
