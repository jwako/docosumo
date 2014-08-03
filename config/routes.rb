Rails.application.routes.draw do

  root to: "top#show"

  devise_scope :admin do
    get 'x', to: "devise/sessions#new", as: :admin_root
  end
  devise_for :admins
  namespace :x do
		resource :home, controller: :home, only: :show
	end

end
