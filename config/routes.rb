Rails.application.routes.draw do
  devise_scope :user do
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    unauthenticated do
      root 'devise/sessions#new'
    end
    authenticated do
      root 'home#index', as: :authenticated_root
    end
  end
end
