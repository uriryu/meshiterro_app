Rails.application.routes.draw do
  root to: "homes#top"
  # root to:はサイトのルートページを決める記述(/にアクセスした場合)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
