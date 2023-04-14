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
  puts '7. Exit'
end

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
