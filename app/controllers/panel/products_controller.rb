module Panel
  class ProductsController < ResourceController
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @products = Product.all
    end

    def show; end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to panel_product_path(@product), notice: 'Product was successfully updated.'
      else
        redirect_to edit_panel_product_path(@product), notice: @product.errors
      end
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      @product.user = current_user

      if @product.save
        redirect_to panel_product_path(@product), notice: 'Product was successfully created.'
      else
        redirect_to new_panel_product_path, alert: @product.errors
      end
    end

    def destroy
      @product.destroy

      redirect_to panel_products_path, notice: 'Product was successfully destroyed.'
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :body, :available, :description, :presentation)
    end
  end
end
