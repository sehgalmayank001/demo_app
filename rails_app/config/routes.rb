Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "about_us#show"
  resources :gallery , :except=>[:destroy], as: 'images'

  match '/contact_us', to: 'contact_us#send_mail' , via: [:post]
  match '/contact_us', to: 'contact_us#new' , via: [:get]
  match '/about_us', to: 'about_us#show', via: [:get]
end
