Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :home_pages
	# resources :admin_pages
	
  root		'home_pages#index'
  get			'/admin_login',				to: 'admin_pages#admin_login'
  get			'/login',							to: 'sessionss#new'
  post		'/login',							to: 'sessions#create'
  delete	'/logout',						to: 'sessions#destroy'
end
