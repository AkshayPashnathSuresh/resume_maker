Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :work_infos, only: [:new]
  resources :education_infos, only: [:new]
  resources :address_infos, only: [:new]
  resources :personal_infos, only: [:new]
  put '/personal_infos/new', to: 'personal_infos#create', as: 'create_personal_infos'
  post '/address_infos/new', to: 'address_infos#create', as: 'create_address_infos'
  post '/education_infos/new', to: 'education_infos#create', as: 'create_education_infos'
  post '/work_infos/new', to: 'work_infos#create', as: 'create_work_infos'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
