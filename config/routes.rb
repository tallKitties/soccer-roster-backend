Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'players#index'
      resources :players
    end
  end
end
