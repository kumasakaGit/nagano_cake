Rails.application.routes.draw do

  namespace :public do
    get "homes/about" => "homes#about", as: '/about'
    get 'customers/mypage' => 'customers#show'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index]
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
      root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
