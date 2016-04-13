Rails.application.routes.draw do
  devise_for :users
	resources :mods do
		resources :items
		resources :blocks
		
		member do
			get 'download'
		end
	end

	get '/' => "mods#index"
end
