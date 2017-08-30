Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  # get 'admin/show'
  resources :prodacts
  resources :charges
  resource :cart, only: [:show]
 resources :order_items, only: [:create, :update, :destroy]
  post 'prodacts/updatestatus'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #root to: "prodacts#index"
  root to: 'pages#index'
  post 'pages/updateuserstatus'
  get 'pages/index'
  get 'pages_controller/index'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  devise_scope :user do
    get 'sign_up', :to => 'devise/registrations#new'
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out',:to => 'devise/sessions#destroy'
  end
end
