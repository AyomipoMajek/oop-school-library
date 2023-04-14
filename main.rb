require './app'

def display_menu
  puts 'Welcome to School Library App!'
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Quit'
end

# def list_all_books(app)
#   app.list_books.each do |book|
#     puts "#{book.title} by #{book.author}"
#   end
# end

# def list_all_people(app)
#   app.list_people.each do |person|
#     puts "#{person.name} (#{person.class})"
#   end
# end

# def create_person(app)
#   puts "Enter the person's name:"
#   name = gets.chomp
#   puts "Enter the person's age:"
#   age = gets.chomp.to_i
#   puts "Enter the person's type (student or teacher):"
#   type = gets.chomp.downcase
#   if type == 'student'
#     puts "Enter the student's grade level:"
#     grade_level = gets.chomp
#     app.create_student(name, age, grade_level)
#     puts 'Student created successfully'
#   elsif type == 'teacher'
#     puts "Enter the teacher's specialty:"
#     specialty = gets.chomp
#     app.create_teacher(name, age, specialty)
#     puts 'Teacher created successfully'
#   else
#     puts 'Invalid person type'
#   end
# end

# def create_book(app)
#   puts 'Enter the book title:'
#   title = gets.chomp
#   puts 'Enter the book author:'
#   author = gets.chomp
#   puts 'Enter the book isbn:'
#   isbn = gets.chomp
#   app.create_book(title, author, isbn)
#   puts 'Book created successfully'
# end

# def create_rental(app)
#   puts "Enter the person's id:"
#   person_id = gets.chomp.to_i
#   puts 'Enter the book title:'
#   book_title = gets.chomp
#   puts 'Enter the rental date (YYYY-MM-DD):'
#   rental_date = gets.chomp
#   app.create_rental(person_id, book_title, rental_date)
#   puts 'Rental created successfully'
# end

# def list_rentals_for_person(app)
#   puts "Enter the person's id:"
#   person_id = gets.chomp.to_i
#   rentals = app.list_rentals_for_person(person_id)
#   rentals.each do |rental|
#     puts "#{rental.book.title} rented on #{rental.rental_date}"
#   end
# end
@app = App.new
def main
  loop do
    display_menu
    choice = gets.chomp.to_i

    case choice
    when 1 then @app.list_books
    when 2 then @app.list_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals_for_person
    else break puts 'Thank you for using this app'
    end
    puts
  end
end

main
