Rails.application.routes.draw do
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#show'
  get 'top', to: 'home#top'
  resources :users, only: [:show, :index]
  resources :rooms, only: [:show, :create]
  resources :posts do  #postsコントローラへのルーティング
    resources :comments, only: [:create, :destroy]
  end
  resources :tags do
    get 'posts', to: 'posts#search'
  end
  resources :activities, only: :index
  resources :notifications, only: :index
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create, :show]

end
