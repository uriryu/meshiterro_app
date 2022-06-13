Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    # resourceのように単数になると/:idがURLに含まれなくなる。
    
    resources :post_comments, only: [:create, :destroy]
  end
   #ターミナルでrails routesと入力するか、config/routes.rbで確認.
  
   # post_imagesが親になりpost_commentsが子になるdo end で挟むことでネストになる。URLは親の後に子のコントローラ名が続く。
  
   #ネストをすることで、params[:post_image_id]でPostImageのidが取得可能になった。 
  
  
  resources :users, only: [:show, :edit, :update]
#   resources :コントローラ名, only: [:アクション...] ・onlyはアクションを指定するもの
  get '/homes/about' => 'homes#about', as: 'about'
  # root to:はサイトのルートページを決める記述(/にアクセスした場合)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
