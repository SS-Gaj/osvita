Rails.application.routes.draw do
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  scope "(:locale)", locale: /en|ru/ do
    get 'profile', to: 'profiles#show'
    resources :profiles
    resources :orders
    # devise_for :users
    devise_for :users, controllers: { sessions: 'users/sessions' }
    # get '/:locale' => 'welcome#index'
    root 'welcome#index'
    get 'welcome/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
