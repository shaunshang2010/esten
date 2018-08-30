Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :home_pages
	# resources :admin_pages
	
  root		'home_pages#index'
  
  get     '/admin_home',              to: 'admin_users#index'
  get			'/signup',									to: 'admin_users#new'
  post    '/signup',                  to: 'admin_users#create'
  
  get			'/admin_login',							to: 'sessions#new'
  post		'/admin_login',							to: 'sessions#create'
  delete	'/admin_logout',						to: 'sessions#destroy'
  
  resources :admin_users
  
end
