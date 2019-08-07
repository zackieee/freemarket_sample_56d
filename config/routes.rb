Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  devise_scope :user do
    get '/users/sign_up/profile' => 'users/registrations#new_profile'
    get '/users/sign_up/telephone' => 'users/registrations#new_telephone'
    get '/users/sign_up/telephone/auth' => 'users/registrations#new_telephone_auth'
    get '/users/sign_up/address' => 'users/registrations#new_address' 
    get '/users/sign_up/payment' => 'users/registrations#new_payment'
    get '/users/sign_up/complete' => 'users/registrations#new_complete'
  end

  root 'products#index'
  resources :products do
    get :buy, :sell, on: :collection #productsにデータを入れたら':collection'を':mender'に変更
  end
  resources :users
end
