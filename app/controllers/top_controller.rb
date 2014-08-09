class TopController < ApplicationController
  def show
  	@categories = Category.all
  end

  def result
    return redirect_to top_path, alert: "重視する項目を選択してください" if params[:weights].blank?
    @categories = Category.all
  	@cities = {}
  	Municipality.with_includes.order(:id).map { |city| @cities.store(city.name, city.calc_point(params[:weights])) }
  	@cities = @cities.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
    render :show
  end

end
