Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :customers, only: %i[create update]
      post '/login', to: 'customers#login'
      get '/auto_login', to: 'customers#auto_login'
      get '/customers/:id', to: 'customers#find_by_id'
      get '/customers', to: 'customers#find_all'
      get '/customers', to: 'customers#find_by_username'
    end
  end
end
