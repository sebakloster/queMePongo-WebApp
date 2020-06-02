Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prendas, only: [:index, :show, :update, :destroy, :create, :new, :edit]
  resources :guardarropas
  resources :atuendos
  root "prendas#index"
end
