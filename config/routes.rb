Rails.application.routes.draw do

  # index root
  root 'users#index'

  # resoruces
  resources :users


end
