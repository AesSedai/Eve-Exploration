Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :map_regions, only: [:index]
      resources :map_constellations, only: [:index]
      resources :map_solar_systems, only: [:index]
    end
  end

  root 'eve#index'

end
