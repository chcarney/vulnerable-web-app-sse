Rails.application.routes.draw do

  # index root
  root 'webappsse/users#index'
  # resoruces
  namespace :webappsse do
    resources :users
  end

end
