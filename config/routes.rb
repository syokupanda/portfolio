Rails.application.routes.draw do
  
  get 'makings/new'
  get 'makings/create'
  get 'makings/edit'
  get 'makings/update'
  get 'makings/destroy'
  namespace :admins do
    resources :accounts, only: [:index, :show, :edit, :update, :destroy]
  end
  
  get 'relationships/create'
  get 'relationships/destroy'
  
  devise_for :admins, controllers: {
    :passwords => 'admins/passwords',
    :sessions => 'admins/sessions'

  }
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :passwords => 'users/passwords',
    :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :reviews, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :accounts, only: [:show, :edit, :update]
  
end
