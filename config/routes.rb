Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/:merchant_id/items', to: 'items#index'
        get '/:merchant_id/invoices', to: 'invoices#index'
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get ':id/favorite_customer', to: 'customers#show'
        get '/most_revenue', to: 'ranks#index'
        get '/revenue', to: 'revenues#index'
        get '/:id/revenue', to: "revenues#show"
        get '/most_items', to: 'most_items#index'


      end
      namespace :customers do
        get '/:customer_id/invoices', to: 'invoices#index'
        get '/:customer_id/transactions', to: 'transactions#index'
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/:id/favorite_merchant', to: 'merchants#show'
      end

      namespace :invoices do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/:id/customer', to: 'customers#show'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'

      end

      namespace :invoice_items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/:id/item', to: 'items#show'
        get '/:id/invoice', to: 'invoices#show'
      end

      namespace :items do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/most_revenue', to: 'revenue#index'
        get '/:id/best_day', to: 'revenue#show'
      end

      namespace :transactions do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/:id/invoice', to: 'invoices#show'
        get '/random', to: 'random#show'
      end

      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
    end
  end
end
