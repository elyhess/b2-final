class Surgery < ApplicationRecord
	has_many :doctor_surgeries
	has_many :doctors, through: :doctor_surgeries
	
	def self.same_day_surgeries(surgery)
		where(day: surgery.day)
			.where.not(id: surgery.id)
	end

end
