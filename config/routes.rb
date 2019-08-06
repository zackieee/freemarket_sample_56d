Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    get :buy, on: :collection #productsにデータを入れたら':collection'を':mender'に変更
  end
  resources :users
end
