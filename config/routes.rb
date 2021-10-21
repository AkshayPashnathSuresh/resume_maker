Rails.application.routes.draw do
  devise_for :users,
         :skip => [:registrations]

  devise_scope :user do
    get "user/sign_up", to: "users/registrations#new", as: :new_user_registration
    post "user/sign_up", to: "users/registrations#create", as: :user_registration
  end

  root 'welcome#index'
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :personal_infos, only: [:new, :edit]
  resources :address_infos, only: [:new, :edit]
  resources :work_infos, only: [:new, :edit]
  resources :education_infos, only: [:new, :edit]
  resources :project_infos, only: [:new, :edit]
  resources :resumes, only: [:show]
  resources :welcome, only: [:destroy]
  get 'settings', to: 'welcome#settings'
  get 'about', to: 'welcome#about'
  get 'privacy_policy', to: 'welcome#privacy_policy'
  get 'add_new_education', to: 'education_infos#add_new_education'
  get 'add_new_work', to: 'work_infos#add_new_work'
  get 'add_new_project', to: 'project_infos#add_new_project'
  get 'delete_education', to: 'education_infos#delete_education'
  get 'delete_work', to: 'work_infos#delete_work'
  get 'delete_project', to: 'project_infos#delete_project'
  get 'skip_continue', to: 'project_infos#skip_continue'
  post '/personal_infos/new', to: 'personal_infos#create', as: 'create_personal_infos'
  post '/personal_infos/:id/edit', to: 'personal_infos#update', as: 'update_personal_infos'
  post '/address_infos/new', to: 'address_infos#create', as: 'create_address_infos'
  post '/address_infos/:id/edit', to: 'address_infos#update', as: 'update_address_infos'
  post '/education_infos/new', to: 'education_infos#create', as: 'create_education_infos'
  post '/education_infos/:id/edit', to: 'education_infos#update', as: 'update_education_infos'
  post '/work_infos/new', to: 'work_infos#create', as: 'create_work_infos'
  post '/work_infos/:id/edit', to: 'work_infos#update', as: 'update_work_infos'
  post '/project_infos/new', to: 'project_infos#create', as: 'create_project_infos'
  post '/project_infos/:id/edit', to: 'project_infos#update', as: 'update_project_infos'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
