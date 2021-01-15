require "rails_helper"

RSpec.describe Hospital, type: :model do
describe 'validations' do
end

describe 'relationships' do
  it { should have_many :doctors }
  it { should have_many(:doctor_surgeries).through(:doctors) }
  it { should have_many(:surgeries).through(:doctor_surgeries) }
end

before :each do
  @hospital = Hospital.create(name: "hospital")
  @surgery = Surgery.new(title: "appendectomy", day: "monday", operating_room_number: 1)
  @surgery1 = Surgery.new(title: "bad", day: "tuesday", operating_room_number: 1)
  @surgery2 = Surgery.new(title: "hurt surgery", day: "monday", operating_room_number: 3)

  @doctor1 = @hospital.doctors.create(name: "A", specialty: "something", university: "CU")
  @doctor2 = @hospital.doctors.create(name: "B", specialty: "xomething", university: "DU")

  DoctorSurgery.create(doctor: @doctor2, surgery: @surgery)
  DoctorSurgery.create(doctor: @doctor1, surgery: @surgery)

  DoctorSurgery.create(doctor: @doctor2, surgery: @surgery1)
  DoctorSurgery.create(doctor: @doctor1, surgery: @surgery1)

  DoctorSurgery.create(doctor: @doctor2, surgery: @surgery2)
  DoctorSurgery.create(doctor: @doctor1, surgery: @surgery2)
end

describe 'instance methods' do
  it '#room_numbers' do
    expect(@hospital.room_numbers).to eq([1, 3])
  end
end

describe 'class methods' do
  it '#surgeries_in_room(number)' do
	  expect(@hospital.surgeries_in_room(1)).to eq([@surgery, @surgery1])
  end
end

end

