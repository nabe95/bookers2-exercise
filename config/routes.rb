Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search", to: "searches#search"
  
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy] #resourceを単数形にすることで１回しかいいねできなくなる
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'followings' => 'relationships#followings', as: 'followings'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
