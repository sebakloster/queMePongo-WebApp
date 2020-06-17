Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prendas, only: [:update, :destroy, :create, :new, :edit]
  resources :guardarropas do
    resources :atuendos
    get 'atuendos-generate', to: 'atuendos#generate'
  end
  root "guardarropas#index"
end
