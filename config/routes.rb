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
    resources :categories do
      resources :indicators, shallow: true do
        resources :indicator_sources do
          post :toggle, on: :member
          resources :open_data do
            post :upload, on: :collection
          end
        end
      end
    end
	end

end
