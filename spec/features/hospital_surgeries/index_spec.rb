require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit the hospital surgery index' do
    before :each do
      @hospital = Hospital.create(name: "hospital")
      @surgery = Surgery.new(title: "appendectomy", day: "monday", operating_room_number: 1)
      @surgery1 = Surgery.new(title: "bad", day: "tuesday", operating_room_number: 2)
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

    it 'I see all surgeries associated with that hospital grouped by hospital room' do
      visit hospital_surgeries_path(@hospital)
      save_and_open_page
      expect(page).to have_content("#{@hospital.name}'s Surgeries")

      within("#operating-room-#{@surgery.operating_room_number}") do
        expect(page).to have_content(@surgery.title)
      end

      within("#operating-room-#{@surgery1.operating_room_number}") do
        expect(page).to have_content(@surgery1.title)
      end

      within("#operating-room-#{@surgery2.operating_room_number}") do
        expect(page).to have_content(@surgery2.title)
      end
    end
  end
end
