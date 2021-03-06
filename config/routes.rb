Rails.application.routes.draw do
  root 'tests#index'

  get 'feedback', to: 'feedback#new'
  post 'feedback', to: 'feedback#create', as: 'feedback_send'

  resources :badges, only: %i[index] do
    get 'my', on: :collection, to: 'badges#show'
  end

  devise_for :users,
    path: :gurus,
    path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :badges, except: :show

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
