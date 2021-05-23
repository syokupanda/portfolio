Rails.application.routes.draw do

  namespace :admins do
    resources :accounts, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show, :edit, :update]
  end

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
  get 'search/search'


  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :reviews, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :makings, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'account/quit' => 'accounts#quit'
  patch 'account/out' => 'accounts#out'
  put 'account/out' => 'accounts#out'

  resources :accounts, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    resources :crops, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  resources :contacts, only: [:index, :show, :new, :create, :destroy]

  resources :categories, only: [:new, :create, :destroy, :index, :edit, :update] do
    get '/category_index' => 'recipes#category_index'
  end

end
