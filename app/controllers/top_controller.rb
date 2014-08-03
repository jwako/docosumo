class TopController < ApplicationController
  def show
  	@categories = Category.all
  end

  def result
  	# "answer"=>{"1"=>{"2"=>"true"}, "2"=>{"3"=>"true"}, "3"=>{"3"=>"true"}, "4"=>{"2"=>"true"}, "5"=>{"2"=>"true"}, "6"=>{"3"=>"true"}}
  	@cities, sum = {}, 0
  	Municipality.all.each do |city|
  		sum = 0
  		sum = city.open_data.inject(0) { |sum, i| i.deviation_value * params[:answers][i.indicator_source.indicator.category.id.to_s].keys.first.to_i }
  		sum /= city.open_data.size
  		@cities.store(city.name, sum)
  	end
  	@cities = @cities.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
  end

end
