Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    member do
      get "archive"
      put "archive"
    end
    collection do
      get :archived
    end
  end
  resources :tasks do
    member do
      get "completion"
      put "completion"
    end
  end
end
