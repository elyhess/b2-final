class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @same_day_surgeries = Surgery.same_day_surgeries(@surgery)
  end
end
