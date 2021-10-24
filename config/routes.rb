Rails.application.routes.draw do

  resources :file_importeds
  devise_scope :user do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
    unauthenticated do
      root 'devise/sessions#new'
    end
    authenticated do
      root 'home#index', as: :authenticated_root
      resources :contacts do
        collection { post :import_csv }
      end
    end
  end
end
