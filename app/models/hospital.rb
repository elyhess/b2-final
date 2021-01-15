class Hospital < ApplicationRecord
	has_many :doctors
	has_many :doctor_surgeries, through: :doctors
	has_many :surgeries, through: :doctor_surgeries

	def room_numbers
		surgeries.distinct.pluck(:operating_room_number)
	end

	def surgeries_in_room(room_number)
		surgeries.distinct.where(operating_room_number: room_number)
	end

end
