Rails.application.routes.draw do

  get 'doctors/edit'
  get 'doctors/doctor'

  resources :doctors do
    resources :appointments
  end

  resources :patients do 
    resources :appointments
  end

  resources :sessions, only: [:new, :create, :destroy]
  root 'patients#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
