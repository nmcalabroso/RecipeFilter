Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    resources :user_sessions, only: [:create, :destroy]
    resources :users
    resource :account, :controller => 'users'
  end

  root 'static_pages#home'
end
