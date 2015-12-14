Rails.application.routes.draw do
	resources :mods do
		resources :items
		resources :blocks
		
		member do
			get 'download'
		end
	end

	get '/' => "welcome#index"
end
