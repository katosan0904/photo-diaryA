Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only:[:show, :index, :destroy, :create, :new, :edit, :update] do
    resources :comments, only:[:index, :create, :destroy]
  end

  resources :categories, only:[:show,:destroy]
end
