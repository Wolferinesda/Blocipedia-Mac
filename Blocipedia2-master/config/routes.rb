Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end
  resources :charges, only: [:new, :create]
  resources :downgrade

  devise_for :users, controllers: { confirmations: 'confirmations' }

  get 'welcome/about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'

  get 'welcome/index'

end
