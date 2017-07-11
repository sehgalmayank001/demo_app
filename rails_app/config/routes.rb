Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users ,:controllers => { :registrations => "registrations" }
  root to: "home#index"
  resources :gallery , :except=>[:destroy], as: 'images' do
    collection { post :import}
  end

  match '/contact_us', to: 'contact_us#send_mail' , via: [:post]
  match '/contact_us', to: 'contact_us#new' , via: [:get]
  match '/about_us', to: 'about_us#show', via: [:get]

  namespace :api, defaults: {format: :json}  do
    resources :users, :only => [:create]
    post '/contact_us', to: 'contact_us#send_mail'
    resources :gallery, :only => [:create,:show], as: 'images'
  end
  match "*path" => redirect("/"), via: [:get, :post]
end
