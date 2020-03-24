Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do 
    # I created them under the API namespace since these are API routes
    resources :users, only: [:create]
    resources :coins
    # Coincount to count the total value of all coins
    get '/coincount', to: 'coins#count'
    resources :transactions, only: [:index, :create]
  end
end
