Rails.application.routes.draw do
  get 'feedback/new'
  get 'feedback/create'
  namespace :admin do
    get 'gists/index'
  end
  root 'tests#index'

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
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
