Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]
   #ターミナルでrails routesと入力するか、config/routes.rbで確認.
  resources :users, only: [:show, :edit]
#   resources :コントローラ名, only: [:アクション...] ・onlyはアクションを指定するもの
  get '/homes/about' => 'homes#about', as: 'about'
  # root to:はサイトのルートページを決める記述(/にアクセスした場合)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
