require("spec_helper")

describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same Patient if it has the same name") do
      patient1 = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      patient2 = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      expect(patient1).to(eq(patient2))
    end
  end

  describe("#save") do
    it("adds a patient to the array of saved patients") do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#id') do
    it('lets you read the ID out') do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      test_patient.save()
      expect(test_patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

end
