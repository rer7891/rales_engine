Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'find#show'
      end
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]

      get '/merchants/most_revenue', to: 'merchants_revenue#index'

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index, :show]
      end
    end
  end
end
