Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home_pages
	resources :admin_pages
	
	match 'admin_login' => 'admin_pages#admin_login', :via => :get
	
  root 'home_pages#index'
  
end
