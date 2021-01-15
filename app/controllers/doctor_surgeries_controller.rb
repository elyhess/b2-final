class DoctorSurgeriesController < ApplicationController
  def create
    doctor = Doctor.find_by(name: params[:name])
    surgery = Surgery.find(params[:surgery_id])
    DoctorSurgery.create(doctor: doctor, surgery: surgery)
    redirect_to surgery_path(surgery)
  end
end
