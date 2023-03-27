Rails.application.routes.draw do
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
    get 'about' => 'homes#about', as: 'about'
    get '/search', to: 'searches#search'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

    resources :seniors, only: [:show, :edit, :index, :update] do
      resource :relationships, only: [:create, :destroy]
  	  get 'followings' => 'relationships#followings', as: 'followings'
  	  get 'followers' => 'relationships#followers', as: 'followers'

  	end
    resources :notices, only: [:show, :index, :destroy, :edit, :update, :create, :new] do
      resources :notice_comments, only: [:create, :destroy, :index]
      resource :favorites, only: [:create, :destroy, :index]
    end
    resources :genres, only: [:show]
  end

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :create, :edit, :update, :new, :show]
    resources :seniors, only: [:index, :show, :edit, :update]
    resources :notices, only: [:index, :show, :destroy] do
      resources :notice_comments, only: [:index, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
