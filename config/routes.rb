Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'static_pages#home'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :history
      post :display
    end
  end
  resources :foods
end
