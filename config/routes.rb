Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'static_pages#home'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :history
      post :history
    end
  end

  resources :foods do
    collection do
      get :search
      post :search
    end
  end

  resources :calories
  # resources :account_activations, only: [:edit]

end
