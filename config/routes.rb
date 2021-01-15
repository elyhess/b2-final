Rails.application.routes.draw do
  resources :hospitals, only: [] do
	  resources :surgeries, controller: "hospital_surgeries", only: [:index]
  end

  resources :surgeries, only: [:index, :show] do
	  resources :doctor_surgeries
  end
end
