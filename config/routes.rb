Rails.application.routes.draw do
  root to: 'rooms#index'
  resources :rooms, only: [:create, :index, :show], param: :token
end
