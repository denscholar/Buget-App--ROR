Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :groups do
      resources :expenses
    end
  end
  # Defines the root path route ("/")
  root 'pages#index'
end
