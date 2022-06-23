Rails.application.routes.draw do

  namespace :public do
    get 'genres/show'
  end
    devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: 'admin/sessions'
    }
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
     }
    namespace :admin do
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      get '/customers/:id/order' => 'customers#order', as: 'customer_orders'
      resources :orders, only: [:index, :show, :update]
      resources :order_details, only: [:update]
    end

    scope module: :public do
      resources :items, only: [:index, :show]
      resources :cart_items, only: [:index, :create, :update, :destroy] do
        collection do
          delete 'all_destroy'
        end
      end
      post '/orders/log' => 'orders#log', as: 'log'
      get '/orders/thanks' => 'orders#thanks', as: 'thanks'
      resources :orders, only: [:index, :show, :new, :create]
      resources :customers, only: [:show, :edit, :update]
      get '/customers/:id/quit' => 'customers#quit', as: 'quit'
      patch '/customers/:id/out' => 'customers#out', as: 'out'
      resources :addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :genres, only: [:show]
      get '/about' => 'homes#about', as: 'about'
      root to: 'homes#top'
    end

end
