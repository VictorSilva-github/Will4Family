Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/contact_us', to: 'pages#contact_us'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles
  resources :messages do
    resources :receive_messages, only: [:new, :create]
  end
  resources :receives

  delete 'receive_messages/:id', to: 'receive_messages#destroy', as: :receive_message
end
