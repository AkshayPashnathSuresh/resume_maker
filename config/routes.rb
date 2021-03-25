Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :work_infos, only: [:new, :create, :update]
  resources :education_infos, only: [:new, :create, :update]
  resources :address_infos, only: [:new, :create, :update]
  resources :personal_infos, only: [:new, :create, :update]
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
