StecmsCoupon::Engine.routes.draw do
  resources :coupons
  resources :promos do
    resources :survey_forms, except: [ :index ]
  end

  resources :survey_forms, only: [] do
    resources :survey_questions, only: [ :create, :edit, :destroy ]
  end

  namespace :api do
    post 'promo/check', to: 'promos#check'
    post 'survey/submit_answer', to: 'survey#submit_answer'
    get 'promo/detail', to: 'promos#detail'

    resources :promos, only: [ :index ]

    resources :coupons, only: [:index, :show] do
      collection do
        post :use
      end
    end
  end
end
