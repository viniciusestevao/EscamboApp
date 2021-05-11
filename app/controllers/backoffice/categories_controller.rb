class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    #@category = CategoryService.create(params_category)
    @category = Category.new(params_category)

    if @category.save
      redirect_to backoffice_categories_path, notice: "A categoria (#{@category.description}) foi criada com sucesso."
    else
      render :new
    end
  end

  def edit
    # Uses before_action to set the category
   # @category = Category.friendly.find(params[:id])
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: "A categoria (#{@category.description}) foi atualizada com sucesso."
    else
      render :edit
    end
  end

  def show
    @categories = Category.all
    respond_to do |format|
      format.html
      format.pdf do 
        render pdf: "categories"
      end
    end
  end

  private

    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def params_category
      params.require(:category).permit(:description)
    end
end