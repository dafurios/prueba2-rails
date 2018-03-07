Rails.application.routes.draw do
  resources :todo_lists, except: [:create]
  resources :todos do
    resources :todo_lists, only: [:create]
  end
  devise_for :users

  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
