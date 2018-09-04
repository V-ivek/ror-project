Rails.application.routes.draw do
  root 'welcome#index'
    resources :users, only: [:index, :create, :show , :new] 
      resources :posts do
        resources :comments
     end
    
  
  # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
