Rails.application.routes.draw do
  # get 'admin/show'
  resources :prodacts #,only: [:index]
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
