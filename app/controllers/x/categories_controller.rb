class X::CategoriesController < AdminController

  def index
  	@categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to x_categories_path, notice: "Category was successfully created."
    else
      render :new
    end
  end

  def edit
    setup_category
  end

  def update
    setup_category
    if @category.update_attributes(category_params)
      redirect_to x_categories_path, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    setup_category
    @category.destroy
    redirect_to x_categories_path, notice: "Category was successfully delted."
  end

  private

  def category_params
    params.require(:category).permit(:id, :title)
  end

  def setup_category
    @category = Category.find(params[:id])
  end

end
