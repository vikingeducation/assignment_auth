Rails.application.routes.draw do
  resources :users

  resource :session, only: [:new, :create, :destroy, :update]
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
end
