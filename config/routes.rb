Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	namespace   :api do
      namespace :v1 do
            post 'auth/register', to: 'users#register'
            post 'auth/login', to: 'users#login'
  			resources :channels,  only: %i(index create update show destroy) do
          collection do
            post 'adduser', to: 'channels#add_user'
          end
        end 
  			resources :conversations,  only: %i(index create show destroy)
  		end
  	end
end
