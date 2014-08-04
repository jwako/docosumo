class X::OpenDataController < AdminController
	before_filter :setup_context, only: [:index, :new, :create, :upload]

  def index
  	@data = @source.open_data
    @form = OpenDataForm.new
  end

  def new
  	@datum = @source.open_data.new
  end

  def create
  	@datum = @source.open_data.new(open_datum_params)
    if @datum.save
      redirect_to x_indicator_source_open_data_path(@source), notice: "Datum was successfully created."
    else
      render :new
    end
  end

  def edit
    setup_open_datum
  end

  def update
    setup_open_datum
    if @datum.update_attributes(open_datum_params)
      redirect_to x_indicator_source_open_data_path(@source), notice: "Datum was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  	setup_open_datum
    @datum.destroy
    redirect_to x_indicator_source_open_data_path(@source), notice: "Datum was successfully deleted."
  end

  def upload
    @form = params[:open_data_form].present? ? OpenDataForm.new(file: params[:open_data_form][:csv_file], source: @source) : OpenDataForm.new
    if @form.valid?
      @form.save_all!
      redirect_to x_indicator_source_open_data_path(@source), notice: "Datum was successfully uploaded."
    else
      @data = @source.open_data
      @form = OpenDataForm.new
      render :index
    end
  end

  private

  def setup_context
  	@source = IndicatorSource.find(params[:indicator_source_id])
  end

  def open_datum_params
    params.require(:open_datum).permit(:id, :value, :deviation_value, :memo)
  end

  def setup_open_datum
    @datum = OpenDatum.find(params[:id])
    @source = @datum.indicator_source
  end
end
