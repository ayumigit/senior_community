Rails.application.routes.draw do

  namespace :public do
    get 'notices/index'
    get 'notices/show'
    get 'notices/edit'
    get 'notices/new'
  end
# 会員用
# URL /seniors/sign_in ...
devise_for :seniors,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    resources :notices
      resources :notice_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :seniors, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
