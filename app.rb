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
    print 'Do you want to create (1) a student or (2) a teacher? [Input the number]: '
    num_input = gets.chomp.to_i
    person_option(num_input)
  end

  def person_option(num_input)
    case num_input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Entry'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.split.map(&:capitalize).join(' ')

    print 'Classroom: '
    classroom = gets.chomp.upcase

    print 'Has parent\'s permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(classroom, age, name, parent_permission)
    @people << student
    puts
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.split.map(&:capitalize).join(' ')

    print 'Specialization: '
    specialization = gets.chomp.split.map(&:capitalize).join(' ')
    teacher_item = Teacher.new(age, specialization, name)
    @people << teacher_item
    puts
    puts 'Teacher created successfully'
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
    puts 'Select a person by ID:'
    list_people
    print 'Person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    puts 'Person not found.' if person.nil?

    puts 'Select a book by title:'
    list_books
    print 'Book Title: '
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    return puts 'Book not found.' if book.nil?

    puts 'Enter date rented (yyyy-mm-dd):'
    rented_at = gets.chomp
    @rentals << Rental.new(book, person, rented_at)
    puts 'Rental created successfully'
  end

  # Method to list all rentals for a given person id
  def list_rentals_for_person
    list_people
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
