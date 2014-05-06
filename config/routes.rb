RailsFreshman::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :articles
  resources :links
  root to: "welcome#index"
end
