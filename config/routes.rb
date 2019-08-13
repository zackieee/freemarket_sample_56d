Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_scope :user do
    #ユーザ新規作成
    get '/users/sign_up/profile' => 'users/registrations#new_profile'
    get '/users/sign_up/telephone' => 'users/registrations#new_telephone'
    get '/users/sign_up/telephone/auth' => 'users/registrations#new_telephone_auth'
    get '/users/sign_up/telephone/check' => 'users/registrations#authcode_check'
    get '/users/sign_up/address' => 'users/registrations#new_address' 
    get '/users/sign_up/payment' => 'users/registrations#new_payment'
    post '/users/sign_up/complete' => 'users/registrations#new_complete'
    #ユーザ編集
    get '/users/edit/profile' => 'users/registrations#edit_profile'
    get '/users/edit/address' => 'users/registrations#edit_address' 
    get '/users/edit/payment' => 'users/registrations#edit_payment'
    get '/users/edit/payment_2' => 'users/registrations#edit_payment_2'
    get '/users/edit/account' => 'users/registrations#edit_account'
    #ユーザサインアウト画面
    get '/users/sign_out' => 'users/sessions#sign_out_confirm'
  end

  root 'products#index'
  get 'products/selling_index' => 'products#selling_index'
  get 'products/selling_show' => 'products#selling_show'
  resources :products do
    get :buy #productsにデータを入れたら':collection'を':mender'に変更
    resources :trades, only: [:create]
  end
  resources :users
end
