Rails.application.routes.draw do
  resources :topics do
    resources :posts
  end
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote

  resources :sponsored_post
  resources :advertisements
  resources :questions
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
