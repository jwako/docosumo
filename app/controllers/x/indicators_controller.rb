class X::IndicatorsController < AdminController
	before_filter :setup_context

  def index
  	@indicators = @category.indicators
  end

  def new
    @indicator = @category.indicators.new
  end

  def create
    @indicator = @category.indicators.new(indicator_params)
    if @indicator.save
      redirect_to x_category_indicators_path(@category), notice: "Indicator was successfully created."
    else
      render :new
    end
  end

  def edit
    setup_indicator
  end

  def update
    setup_indicator
    if @indicator.update_attributes(indicator_params)
      redirect_to x_category_indicators_path(@category), notice: "Indicator was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    setup_indicator
    @indicator.destroy
    redirect_to x_category_indicators_path(@category), notice: "Indicator was successfully deleted."
  end

  private

  def setup_context
  	@category = Category.find(params[:category_id])
  end

  def indicator_params
    params.require(:indicator).permit(:id, :title)
  end

  def setup_indicator
    @indicator = @category.indicators.find(params[:id])
  end

end
