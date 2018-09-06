Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
      resources :posts  do
        resources :comments
     end
    
  get 'like/add_like/:id' => 'like#add_like', :as => "add_like"
  # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
