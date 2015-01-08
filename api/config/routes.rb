Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    resources :users, except: [:new, :edit] do
      collection do
        post '/login', to: 'user_sessions#create', as: 'login'
        delete '/logout', to: 'user_sessions#destroy', as: 'logout'

      end
    end

    resource :user, only: [] do
      get '/recipes', to: 'recipes#user_recipes', as: 'recipes'
    end

    resources :recipes, except: [:new, :edit] do
      collection do
        get '/count/:count/order/:order', to: 'recipes#batch', as: :batch
        get 'search', to: 'recipes#search', as: :search
      end

      resources :ingredients, except: [:new, :edit, :show]
      resources :steps, except: [:new, :edit, :show]
    end
  end

  root 'static_pages#home'
end
