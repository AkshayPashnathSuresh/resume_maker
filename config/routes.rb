Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :personal_infos, only: [:new, :create, :update]
  resources :cv_user_address, only: [:new, :create, :update]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
