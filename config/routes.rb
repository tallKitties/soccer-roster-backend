Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      root 'players#index'
      namespace :players do
        get 'positions'
      end
      resources :players
    end
  end
end
