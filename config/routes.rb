Rails.application.routes.draw do
  namespace :api do
      resources :cards, only: [:index, :update, :destroy], constraints: { format: 'json' }
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    end
end
