Rails.application.routes.draw do

 get 'admins/sign_up' => redirect('/404.html')
  devise_for :admins
  root 'students#index'
  
  resources :students

end
