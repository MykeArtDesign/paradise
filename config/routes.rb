Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :destinations
    end
  end

  root to: 'home#index'
  post :signin, to: 'signin#create'
  delete :signin, to: 'signin#destroy'
  post :refresh, to: 'refresh#create'
  resources :users, only: [:create]
end
