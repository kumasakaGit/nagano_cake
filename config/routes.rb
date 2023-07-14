Rails.application.routes.draw do

  root to: "public/homes#top"

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get 'orders/show'
  end
  namespace :public do

    get "homes/about" => "homes#about", as: :about
    get 'customers/mypage' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
          delete "all_destroy"
        end
    end
    resources :orders, only: [:index, :new, :create, :show]
    post 'orders/confirm'
    get 'orders/complete'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
