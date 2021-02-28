Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :cv_user_main_details, only: [:new, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
