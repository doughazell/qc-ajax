Mailer::Application.routes.draw do
  resources :newsletters do
    #member { post :deliver }
    member do
      post :deliver
      get :reply
    end
  end
  root to: 'newsletters#index'
end
