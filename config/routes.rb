Rails.application.routes.draw do
  namespace :api do
      resources :cards, only: [:index], constraints: { format: 'json' }
    end
end
