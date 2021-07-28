Rails.application.routes.draw do
  root 'tasks#index'
  resources :messages
  resources :tasks

  delete 'destroy_task/:id', to: 'tasks#destroy', as: 'destroy_task'
  delete 'destroy_message/:id', to: 'messages#destroy', as: 'destroy_message'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
