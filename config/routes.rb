Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects, only: [:index, :new, :create, :show]
  get 'edit_description/:id', to: 'projects#edit_description', as: 'edit_project_description'
  resources :orders, only: [:new, :create, :show]
end
