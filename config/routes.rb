Fotos::Application.routes.draw do
  
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  
  get "signup" => "users#new", :as => "signup"
  
  get "pages/home" => "pages#home"
  get "pages/about" => "pages#about"
  get "pages/gallery" => "pages#gallery"
  get "pages/equipment" => "pages#equipment"
  #get "pages/contact" => "pages#contact"

      
  root :to => "pages#home"
  
  match "products/category_search/:term" => "products_search#category_search"
  match "products/sub_category_search/:term" => "products_search#sub_category_search"
  
  resources :products  do
    resources :specs, :controller => "products/specs"
    resource :image, :controller => "products/image"
  end
  
  resources :users
  resources :sessions
  

end
