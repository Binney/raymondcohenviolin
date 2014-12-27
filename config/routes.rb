Raymondcohenviolin::Application.routes.draw do
 
  root "static_pages#home" 
  resources :albums, :pictures # TODO pictures shouldn't have show actions

  match "/home", to: 'static_pages#home', via: 'get'
  match "/about", to: 'static_pages#about', via: 'get'
  match "/biography", to: 'static_pages#biography', via: 'get'
  match "/contact", to: 'static_pages#contact', via: 'get'

  match "/gallery", to: 'pictures#index', via: 'get'
  match "/music", to: 'albums#index', via: 'get'

  scope "/gallery" do
  	match "/manage", to: 'pictures#manage', via: 'get'
  end

  scope "/music" do
  	match "/manage", to: 'albums#manage', via: 'get'
  end

end
