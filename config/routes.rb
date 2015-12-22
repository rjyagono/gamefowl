GameFowl::Application.routes.draw do
	
  # get 'facebooks/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	
  resources :contacts
  resources :profiles


  get "comments/index"

  get "comments/create"

  # get 'auth/:provider/callback', to: "registrations#create"

  delete 'sign_out', to: "registrations#destroy", as: 'sign_out'



  devise_for :users, :controllers => { :registrations => "registrations", omniauth_callbacks: "omniauth_callbacks" }

	resources :fowls do
		member do
			put "like", to: 'fowls#upvote'
		end
		resources :comments		
	end
	
   root :to => 'fowls#index'

  # match '/', to: 'fowls#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'fowls#index', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]

end
