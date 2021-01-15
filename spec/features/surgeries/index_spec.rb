require 'rails_helper'

RSpec.describe 'As a visitor' do
	describe 'when i visit the surgeries index page' do
		before :each do
			@hospital = Hospital.create(name: "hospital")
			@surgery = Surgery.new(title: "surgery", day: "monday", operating_room_number: 1)

			@doctor1 = @hospital.doctors.create(name: "A", specialty: "something", university: "CU")
			@doctor2 = @hospital.doctors.create(name: "B", specialty: "xomething", university: "DU")

			DoctorSurgery.create(doctor: @doctor2, surgery: @surgery)
			DoctorSurgery.create(doctor: @doctor1, surgery: @surgery)
		end

		it 'I see each surgery and all of the doctors performing that surgery' do
			visit surgeries_path

			expect(page).to have_link(@surgery.title)
			expect(page).to have_content(@doctor1.name)
			expect(page).to have_content(@doctor2.name)
		end
	end
end
