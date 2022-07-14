Rails.application.routes.draw do
  resources :employees
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'import', to: 'import/show'
  post 'import', to: 'import/import' 
end
