Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations",
    sessions: 'users/sessions',
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
    post 'users/omniauth_callbacks' => 'users/omniauth_callbacks#passthru'
    #ユーザ編集
    get '/users/edit/profile' => 'users/registrations#edit_profile'
    post '/users/edit/profile' => 'users/registrations#update_profile'
    get '/users/edit/address' => 'users/registrations#edit_address' 
    post '/users/edit/address' => 'users/registrations#update_address' 
    get '/users/edit/payment' => 'users/registrations#edit_payment'
    get '/users/edit/payment_2' => 'users/registrations#edit_payment_2'
    post '/users/edit/payment_2' => 'users/registrations#update_payment'
    delete '/user/delete/payment' => 'users/registrations#destroy_payment'
    get '/users/edit/account' => 'users/registrations#edit_account'
    post '/users/edit/account' => 'users/registrations#update_account'
    get '/users/edit/telephone' => 'users/registrations#edit_telephone'
    get '/users/edit/telephone/auth' => 'users/registrations#edit_telephone_auth'
    post '/users/edit/telephone/auth' => 'users/registrations#update_telephone_auth'
    # パスワード編集
    get 'users/edit/password' => 'users/registrations#edit_password'
    post 'users/edit/password' => 'users/registrations#update_password'
    #ユーザサインアウト画面
    get '/users/sign_out' => 'users/sessions#sign_out_confirm'
  end

  root 'products#index'

  get 'producs/all_products'   => 'products#all_products'
  get 'products/selling_index' => 'products#selling_index'
  get 'products/buyout_index'  => 'products#buyout_index'
  # カテゴリ選択
  get 'products/get_category_children'  => 'products#get_category_children'
  get 'products/get_category_grandchildren'  => 'products#get_category_grandchildren'

  get 'products/search_result_page' => 'products#search_result_page'
  resources :products do
    get :selling_show, on: :member
    get :buy, on: :member
    resources :trades, only: [:create]
  end
  resources :users do
    member do
      get 'show_profile'
    end
  end

  get "mypage/favorites" => "favorites#index"
  post "/products/:product_id/favorites" => "favorites#create"
  delete "/products/:product_id/favorites" => "favorites#destroy"

end
