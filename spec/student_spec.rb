require_relative '../student'

describe Student do
  before :all do
    @student = Student.new('science', 23, 'Sofia')
  end

  it 'checks if student class creates a new instance' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'checks if classroom is science' do
    expect(@student.classroom).to eql 'science'
  end

  it 'checks if age is 23' do
    expect(@student.age).to eql 23
  end

  it 'checks if name is Sofia' do
    expect(@student.name).to eql 'Sofia'
  end
  it 'Check if play_hooky return ' do
    expect(@student.play_hooky).to eql '¯\\(ツ)/¯'
  end
end
