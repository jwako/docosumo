class X::UploadersController < AdminController

  def show
    @form = OpenDataForm.new
  end

  def upload
    @form = params[:open_data_form].present? ? OpenDataForm.new(file: params[:open_data_form][:csv_file]) : OpenDataForm.new
    if @form.valid?
      @form.save_all!
      redirect_to x_home_path,  notice: 'The data was successfully uploaded.'
    else
	    @form = OpenDataForm.new
      render :show
    end
  end

end
