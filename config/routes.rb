Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :personal_infos, only: [:new, :edit]
  resources :address_infos, only: [:new, :edit]
  resources :work_infos, only: [:new, :edit]
  resources :education_infos, only: [:new, :edit]
  resources :resume_infos, only: [:new]
  resources :resumes, only: [:show]
  get 'add_new_education', to: 'education_infos#add_new_education'
  get 'set_delete_education_ids', to: 'education_infos#set_delete_education_ids'
  get 'add_new_work', to: 'work_infos#add_new_work'
  get 'set_delete_work_ids', to: 'work_infos#set_delete_work_ids'
  post '/personal_infos/new', to: 'personal_infos#create', as: 'create_personal_infos'
  post '/personal_infos/edit', to: 'personal_infos#update', as: 'update_personal_infos'
  post '/address_infos/new', to: 'address_infos#create', as: 'create_address_infos'
  post '/address_infos/edit', to: 'address_infos#update', as: 'update_address_infos'
  post '/education_infos/new', to: 'education_infos#create', as: 'create_education_infos'
  post '/education_infos/edit', to: 'education_infos#update', as: 'update_education_infos'
  post '/work_infos/new', to: 'work_infos#create', as: 'create_work_infos'
  post '/work_infos/edit', to: 'work_infos#update', as: 'update_work_infos'
  post '/resume_infos/new', to: 'resume_infos#create', as: 'resume_work_infos'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
