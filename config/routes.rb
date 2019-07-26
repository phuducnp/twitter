
Rails.application.routes.draw do
  devise_for :users, :controller => { registrations: 'registrations' }
  resources :tweeets
  root 'tweeets#index'
end
