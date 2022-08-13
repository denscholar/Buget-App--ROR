Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users do
    resources :groups do
      resources :expenses
    end
  end
  root 'pages#index'
end
