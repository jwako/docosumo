class X::HomeController < ApplicationController
	before_filter :authenticate_admin!

  def show
  end
  
end
