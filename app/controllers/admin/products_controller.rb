module Admin
  class ProductsController < BaseController
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @products = Product.all
    end

    def show; end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_product_path(@product),
                    notice: t('.success')
      else
        redirect_to edit_admin_product_path(@product),
                    alert: @product.errors.full_messages
      end
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params.merge(admin_user: current_admin_user))

      if @product.save
        redirect_to admin_product_path(@product),
                    notice: t('.success')
      else
        redirect_to new_admin_product_path,
                    alert: @product.errors.full_messages
      end
    end

    def destroy
      @product.destroy

      redirect_to admin_products_path,
                  notice: t('.success')
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product)
            .permit(:title,
                    :price,
                    :body,
                    :available,
                    :description,
                    :presentation)
    end
  end
end
