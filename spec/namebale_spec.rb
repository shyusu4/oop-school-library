require_relative '../nameable'
require_relative '../person'
describe Nameable do
 before :all do
    person = Person.new(25, 'sherrymicronat',true)
    @capitalizeDecorator = CapitalizeDecorator.new(person)
    @capitalizeTrimer = TrimmerDecorator.new(@capitalizeDecorator)
 end

 it 'Check the person name is capitalized' do
     expect(@capitalizeDecorator.correct_name).to eql 'Sherrymicronat'
 end
  it 'Check the person name is trimmed' do
     expect(@capitalizeTrimer.correct_name).to eql 'Sherrymic'
 end
end