require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(23, 'Sofia', true)
  end

  it 'checks if person class creates a new instance.' do
    expect(@person).to be_an_instance_of(Person)
  end
end