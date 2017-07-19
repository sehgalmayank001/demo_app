Rails.application.routes.draw do
  require 'sidekiq/web'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users ,:controllers => { :registrations => "registrations" }
  root to: "home#index"
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  resources :gallery , :only=>[:index,:create,:update],concerns: :paginatable, as: 'images' do
    collection { post :import}
  end
  match '/gallery/get_img_cnt', to: 'gallery#get_img_cnt',  via: [:get]
  mount Sidekiq::Web, at: '/sidekiq'
  match '/contact_us', to: 'contact_us#send_mail' , via: [:post]
  match '/contact_us', to: 'contact_us#new' , via: [:get]
  match '/about_us', to: 'about_us#show', via: [:get]

  namespace :api,  constraints:{format: :json}  do
    resources :users, :only => [:create]
    post '/contact_us', to: 'contact_us#send_mail'
    resources :gallery, :only => [:create,:show,:index], as: 'images'
    match '/:invalid_format', to: 'errors#bad_format', via: [:get, :post]
    match "*path", to: 'errors#show', via: [:get, :post]
  end
  match "*path" => redirect("/"), via: [:get, :post]
end
