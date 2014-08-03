class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    return x_home_path if resource.is_a?(Admin)
    return root_path
  end
  
end
