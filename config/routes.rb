Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  # root to: 'cateborys#index'
  resources :items
  

end

