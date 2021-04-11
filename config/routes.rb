Rails.application.routes.draw do
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
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
