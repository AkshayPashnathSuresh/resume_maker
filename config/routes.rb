Rails.application.routes.draw do
  get 'cv_user_main_details/create'
  get 'cv_user_main_details/update'
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
