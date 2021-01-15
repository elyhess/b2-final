require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit a surgery show page' do
    before :each do
      @hospital = Hospital.create(name: 'hospital')
      @surgery = Surgery.create(title: 'x', day: 'monday', operating_room_number: 1)
      @surgery1 = Surgery.create(title: 'y', day: 'monday', operating_room_number: 2)
      @surgery2 = Surgery.create(title: 'z', day: 'x', operating_room_number: 1)

      @doctor1 = @hospital.doctors.create(name: 'A', specialty: 'something', university: 'CU')
      @doctor2 = @hospital.doctors.create(name: 'B', specialty: 'xomething', university: 'DU')

      DoctorSurgery.create(doctor: @doctor2, surgery: @surgery)
      DoctorSurgery.create(doctor: @doctor1, surgery: @surgery)
    end

    it 'I see the surgeries info & all surgeries occuring on the same day' do
	    visit surgery_path(@surgery)

	    expect(page).to have_content(@surgery.title)
	    expect(page).to have_content(@surgery.operating_room_number)

	    within('#same-day-surgeries') do
	      expect(page).to have_content(@surgery1.title)
	    end
    end
  end
end
