Rails.application.routes.draw do

  #管理者用devise_controller
    devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: 'admin/sessions'
    }

    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
     }

    #管理者
    namespace :admin do
      #商品
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      #ジャンル
      resources :genres, only: [:index, :create, :edit, :update]
      #会員
      resources :customers, only: [:index, :show, :edit, :update]
      #注文
      resources :orders, only: [:index, :show, :update]
      #注文詳細
      resources :order_details, only: [:update]
    end


    #顧客
    scope module: :public do
      #商品
      resources :items, only: [:index, :show]
      #カート内商品
      resources :cart_items, only: [:index, :create, :update, :destroy] do
        collection do
        #カート内商品をすべて削除
          delete 'all_destroy'
        end
      end
      #注文
      post '/orders/log' => 'orders#log', as: 'log'
            #注文完了画面
      get '/orders/thanks' => 'orders#thanks', as: 'thanks'
            #注文情報確認画面
      resources :orders, only: [:index, :show, :new, :create]

      #会員
      resources :customers, only: [:show, :edit, :update]
      #ユーザ退会画面
      get '/customers/:id/quit' => 'customers#quit', as: 'quit'
      #ユーザ退会
      patch '/customers/:id/out' => 'customers#out', as: 'out'
      #配送先
      resources :addresses, only: [:index, :create, :edit, :update, :destroy]
      #homeコントローラ(top画面about画面)
      get '/about' => 'homes#about', as: 'about'
      root to: 'homes#top'
    end

end
