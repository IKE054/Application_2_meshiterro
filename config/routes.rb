Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'

  # only: 不要なルーティングが作成されないように制限する
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
