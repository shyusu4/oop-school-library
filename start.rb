require_relative './app'
class Start
    def initialize
        @app = App.new
    end
      def entry_point
    puts 'Welcome to School Library App!'

    loop do
      app_options
      app_choice = gets.chomp.to_i
      break if app_choice == 7

      options(app_choice)
    end
  end

  def app_options
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
  end

  def options(input)
    case input
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
       @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thanks for using the school library!'
      exit
    else
      puts 'Invalid Entry'
    end
  end
end