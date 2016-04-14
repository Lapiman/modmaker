Rails.application.routes.draw do
  devise_for :users
	resources :mods do
		resources :items
		resources :blocks
		
		member do
			get 'download'
		end
	end

	authenticated do
		get '/' => "mods#index"
	end

	get '/' => "welcome#index"
end
