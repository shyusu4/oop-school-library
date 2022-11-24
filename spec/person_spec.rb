require_relative '../person'

describe Person do
  before :all do
    @person = Person.new(23, 'Sofia', true)
  end

  it 'checks if person class creates a new instance.' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'checks if age is 23' do
    expect(@person.age).to eql 23
  end

  it 'checks if name is Sofia' do
    expect(@person.name).to eql 'Sofia'
  end

  it 'checks if Sofia has parent permission' do
    expect(@person.parent_permission).to be true
  end
  it 'Check if  correct_name methos return Sofia' do
    expect(@person.correct_name).to eql 'Sofia'
  end

  it 'Check if add_rental can add rentals' do
    rental1 = double('rental')
    rental2 = double('rental')
    @person.add_rental(rental2)
    @person.add_rental(rental1)
    expect(@person.rentals.size).to eq(2)
  end

  it 'Check if can_use_services? return true' do
    expect(@person.can_use_services?).to be true
  end
end
