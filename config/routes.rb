Rails.application.routes.draw do
  constraints host: "baukis2.example.com" do
    namespace :staff, path: "" do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ]
    end
  end

  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    resource :session, only: [ :create, :destroy ]
    resources :staff_members, path: "staff"
  end

  namespace :customer do
    root "top#index"
  end
end