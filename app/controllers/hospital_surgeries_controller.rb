class HospitalSurgeriesController < ApplicationController
	def index
		@hospital = Hospital.find(params[:hospital_id])
		@room_numbers = @hospital.room_numbers
	end
end
