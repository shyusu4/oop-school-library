require_relative '../classroom'
require_relative '../student'
describe Classroom do
  before :all do
    @classroom = Classroom.new('Section')
  end
  it 'Check if the number of student is 3' do
    stud1 = Student.new('A', 22, 'Meron')
    stud2 = Student.new('A', 22, 'Alon')
    stud3 = Student.new('A', 22, 'Jackob')
    @classroom.add_student(stud1)
    @classroom.add_student(stud2)
    @classroom.add_student(stud3)
    expect(@classroom.students.size).to eql 3
  end

  it 'Check if the classroom has Section label' do
    expect(@classroom.label).to eql 'Section'
  end

  it 'Check if the classroom label is changed' do
    @classroom.label = 'Programming'
    expect(@classroom.label).to eql 'Programming'
  end
end
