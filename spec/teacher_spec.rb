require_relative '../teacher'
describe Teacher do
    before :all do
        @teacher = Teacher.new("Full-stack", 32,'Samuel', parent_permission: true)
    end

     it 'checks if teacher class creates a new instance' do
        expect(@teacher).to be_an_instance_of(Teacher)
      end

      it "Check if teacher specialization is a full-stack" do
         expect(@teacher.specialization).to eq "Full-stack"
      end

      it "Check if teacher can get a service" do
        expect(@teacher.can_use_services?).to be  true  
      end

      it 'Check if the teacher id is changed' do
        @teacher.id = 85
        expect(@teacher.id).to eql 85
      end



end