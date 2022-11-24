require_relative '../nameable'
require_relative '../person'
describe Nameable do
  before :all do
    person = Person.new(25, 'sherrymicronat', true)
    @capitalize_decorator = CapitalizeDecorator.new(person)
    @capitalize_trimer = TrimmerDecorator.new(@capitalize_decorator)
  end

  it 'Check the person name is capitalized' do
    expect(@capitalize_decorator.correct_name).to eql 'Sherrymicronat'
  end
  it 'Check the person name is trimmed' do
    expect(@capitalize_trimer.correct_name).to eql 'Sherrymic'
  end
end
