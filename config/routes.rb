Rails.application.routes.draw do

  root 'tests#index'
  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
  end
end
