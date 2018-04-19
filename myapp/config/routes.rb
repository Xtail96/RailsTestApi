Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #resources :users, only: %i[index create update auth]
      resources :users, only: %i[index create]
      post '/users/auth', action: :auth, controller: 'users'
      post '/users/reset_password', action: :reset_password, controller: 'users'

      resources :tokens, only: %i[index]
    end
  end
end
