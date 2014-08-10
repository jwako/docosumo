class CitiesController < ApplicationController

  def show
  	@city = Municipality.find(params[:id])
  	@data = @city.open_data
  	render json: @data
  end

end
