Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root 'post_images#index'

  # only: 不要なルーティングが作成されないように制限する
  resources :post_images, only: [:new, :create, :index, :show] do
  	resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
	end
    #親子関係にある子にはsをつけない。単数にするとコントローたのidをリクエストに含まれなくするため。
    
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
end
	resources :users, only: [:show]

end
