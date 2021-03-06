Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "search" => "searches#search"
  resources :users, only: [:index, :show, :edit, :update]
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  devise_for :admins, path: :admin, views: {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    root to: "homes#top"
  end
end
