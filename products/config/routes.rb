Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index create destroy update show]
      resources :category, only: %i[index create destroy update show]
    end
  end
end
