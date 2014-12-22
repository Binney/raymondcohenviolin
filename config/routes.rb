Raymondcohenviolin::Application.routes.draw do
 
  root "static_pages#home" 
  resources :songs, :albums

  match "/home", to: 'static_pages#home', via: 'get'
  match "/about", to: 'static_pages#about', via: 'get'
  match "/biography", to: 'static_pages#biography', via: 'get'
  match "/contact", to: 'static_pages#contact', via: 'get'

end
