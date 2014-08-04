class X::IndicatorSourcesController < AdminController
	before_filter :setup_context, only: [:index, :new, :create]

  def index
  	@sources = @indicator.indicator_sources
  end

  def new
  	@source = @indicator.indicator_sources.new
  end

  def create
  	@source = @indicator.indicator_sources.new(indicator_source_params)
    if @source.save
      redirect_to x_indicator_indicator_sources_path(@indicator), notice: "Source was successfully created."
    else
      render :new
    end
  end

  def edit
    setup_indicator_source
  end

  def update
    setup_indicator_source
    if @source.update_attributes(indicator_source_params)
      redirect_to x_indicator_indicator_sources_path(@indicator), notice: "Source was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    setup_indicator_source
    @source.destroy
    redirect_to x_indicator_indicator_sources_path(@indicator), notice: "Source was successfully deleted."
  end

  private

  def setup_context
  	@indicator = Indicator.find(params[:indicator_id])
  end

  def indicator_source_params
    params.require(:indicator_source).permit(:id, :title, :sub_title, :year, :month, :url, :authority)
  end

  def setup_indicator_source
    @source = IndicatorSource.find(params[:id])
    @indicator = @source.indicator
  end

end
