class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @doctors = Doctor.names
    @surgery = Surgery.find(params[:id])
    @same_day_surgeries = Surgery.same_day_surgeries(@surgery)
  end
end
