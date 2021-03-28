Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources 'rooms', only: :show
  resources 'messages'
end
