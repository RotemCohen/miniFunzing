Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'activity#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :activity do
    resources :orders
  end
  get 'orders', to: 'orders#index'
  get 'activities', to: 'activity#index'
end
