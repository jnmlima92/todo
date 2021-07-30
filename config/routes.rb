Rails.application.routes.draw do
  root 'tasks#index'
  resources :messages
  resources :tasks
  resources :event_tracks, only: [:index]

  delete 'destroy_task/:id', to: 'tasks#destroy', as: 'destroy_task'
  delete 'destroy_message/:id', to: 'messages#destroy', as: 'destroy_message'
  get 'mark_as_done/:id', to: 'tasks#mark_as_done', as: 'done_task'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
