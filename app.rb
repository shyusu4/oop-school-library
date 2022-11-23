require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './book_addition'
require_relative './data'
require_relative './student_addition'
require_relative './teacher_additions'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @data = Data.new
  end

  def list_books
    if File.size?('./data/book.json')
      file = @data.read_data('book.json').split(";")
      file.each_with_index do |book1, index|
      book = JSON.parse(book1,create_additions: true)
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'No books found'
    end
  end

  def list_people
        if File.size?('./data/person.json')
      file = @data.read_data('person.json').split(";")
      file.each_with_index do |p, index|
      person = JSON.parse(p, create_additions: true)
            puts "#{index} [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      end
    else
      puts 'No person found'
    end
    
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)

    book1 = JSON.generate(book)
    @data.write_data('book.json', book1)

    ## @books << book
    puts 'Book created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num_input = gets.chomp.to_i
    person_option(num_input)
    puts 'Person Created Successfully'
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
    name = gets.chomp.capitalize

    print 'Has parent\'s permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    print "CLassroom :"
    @classroom = gets.chomp

    student_item = Student.new(@classroom, age, name, parent_permission: parent_permission)
    stud1 = JSON.generate(student_item)

    @data.write_data("person.json", stud1)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.capitalize

    print 'Specialization: '
    specialization = gets.chomp.downcase

    teacher_item = Teacher.new(specialization, age, name)
    teacher_json = JSON.generate(teacher_item)
    
    @data.write_data("person.json",teacher_json)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    selected_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    list_people
    selected_person = gets.chomp.to_i
    print 'Date (DD/MM/YYYY): '
    date = gets.chomp
    book = @books[selected_book]
    person = @people[selected_person]
    rental_item = Rental.new(date, book, person)
    @rentals << rental_item
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author}) if rental.person.id == id
    end
  end
end
