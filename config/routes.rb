Fotos::Application.routes.draw do
  get "pages/home"

  get "pages/about"

  get "pages/gallery"

  get "pages/contact"

  resources :products  do
    resources :specs, :controller => "products/specs"
    resource :image, :controller => "products/image"
  end
  
  resources :users
  resources :sessions

end
