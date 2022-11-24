require_relative '../rental'
require_relative '../book.rb'
require_relative '../Teacher'
require_relative '../person'


describe Rental do
    before :all do
        book = Book.new('DSA','Meshu')
        person = Teacher.new('Comuter', 38, 'SHerry')
        @rental = Rental.new('12-02-2022',book, person)
    end

    it 'Check if rental.book is an instance of Book' do
        expect(@rental.book).to be_an_instance_of Book
    end
     it 'Check if rental.person is an instance of Person' do
        expect(@rental.person).to be_an_instance_of Teacher
    end

     it 'Check if rental date is 12-02-2022' do
        expect(@rental.date).to eql '12-02-2022'
    end
end