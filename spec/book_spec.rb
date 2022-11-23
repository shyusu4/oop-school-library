require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
  end

  it 'checks if book class creates a new instance.' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'checks if book class has a title' do
    expect(@book.title).to eq('The Great Gatsby')
  end

  it 'checks if book class has an author' do
    expect(@book.author).to eq('F. Scott Fitzgerald')
  end
end