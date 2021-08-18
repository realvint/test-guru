Rails.application.routes.draw do

  get 'users/new'

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: %i[create]

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
