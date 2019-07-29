Rails.application.routes.draw do
  devise_for :users, :controller => { registrations: 'registrations' }
  resources :tweeets, except: :new
  root 'tweeets#index'
end