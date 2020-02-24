Rails.application.routes.draw do
  resources :conversations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	scope :api do
      scope :v1 do
            post 'auth/register', to: 'api/v1/users#register'
            post 'auth/login', to: 'api/v1/users#login'
  			resources :channels, module: 'api/v1'
  			resources :conversations, module: 'apiv1'
  		end
  	end
end
