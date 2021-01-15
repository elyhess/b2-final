require "rails_helper"

RSpec.describe Doctor, type: :model do
describe 'validations' do
end

describe 'relationships' do
  it { should belong_to :hospital }
  it { should have_many :doctor_surgeries }
  it { should have_many(:surgeries).through(:doctor_surgeries) }
end

describe 'instance methods' do
end

describe 'class methods' do
  it '::names' do
    @hospital = Hospital.create(name: "hospital")
    @surgery1 = Surgery.create(title: "surgery", day: "monday", operating_room_number: 1)
    @surgery2 = Surgery.create(title: "surgery", day: "tuesday", operating_room_number: 1)
    @surgery3 = Surgery.create(title: "surgery", day: "wednesday", operating_room_number: 1)
    @surgery4 = Surgery.create(title: "surgery", day: "monday", operating_room_number: 1)

    @doctor1 = @hospital.doctors.create(name: "A", specialty: "something", university: "CU")
    @doctor2 = @hospital.doctors.create(name: "B", specialty: "xomething", university: "DU")

    DoctorSurgery.create(doctor: @doctor2, surgery: @surgery)
    DoctorSurgery.create(doctor: @doctor1, surgery: @surgery)

    expect(Doctor.names).to eq(["A", "B"])
  end
end

end

