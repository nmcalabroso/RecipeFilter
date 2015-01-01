Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    resources :users do
      collection do
        post '/login', to: 'user_sessions#create', as: 'login'
        delete '/logout', to: 'user_sessions#destroy', as: 'logout'
      end
    end
  end

  root 'static_pages#home'
end
