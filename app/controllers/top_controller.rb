class TopController < ApplicationController
  def show
  	@categories = Category.all
  end

  def create
    return redirect_to top_path, alert: "重視する項目を選択してください" if params[:weights].blank?
    @categories = Category.all
    @cities = {}
    Municipality.with_includes.order(:id).map do |city| 
      hash = { id: city.id, name: city.name }
      @cities.store(hash, city.calc_point(params[:weights]))
    end
    @cities = @cities.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
    render json: @cities
  end

  def categories
    @categories = Category.all
    render json: @categories
  end
end
