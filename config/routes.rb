Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prendas, only: [:update, :destroy, :create, :new, :edit]
  resources :guardarropas do
    resources :atuendos
    get 'atuendos-generate', to: 'atuendos#generate'
  end
  root "landing#index"

  get '/home', to: "landing#index"
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
