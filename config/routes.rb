Rails.application.routes.draw do
  resources :questions, only: :index
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  scope "(:locale)", locale: /en|ru/ do
    resources :parts, only: :show
    #get '/books/:id' =>  'parts#index', book_id: 'id'
    get '/books/new' =>  'books#new'
    get '/books/:id' =>  'parts#index'
    resources :books, only: [:index, :show]
    namespace :admin do
      resources :books, :parts, :questions
    end
    resources :payments
    get 'profile', to: 'profiles#show'
    resources :profiles
    resources :orders
    as :user do
      get "profileshow", to: "users/sessions#show_profile"
    end
    # devise_for :users
    # devise_for :users, controllers: { sessions: 'users/sessions' }
    devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    # get '/:locale' => 'welcome#index'
    root 'welcome#index'
    get 'welcome/index'
    match '/free',    to: 'welcome#free',    via: 'get'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

