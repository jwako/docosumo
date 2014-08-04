Rails.application.routes.draw do

  root to: "top#show"
  resource :top, controller: :top, only: [:show] do
    post :result
  end

  devise_scope :admin do
    get 'x', to: "devise/sessions#new", as: :admin_root
  end
  devise_for :admins
  namespace :x do
		resource :home, controller: :home, only: :show
    resource :uploaders, only: :show do
      post :upload
    end
    resources :categories do
      resources :indicators
    end
	end

end
