class ProductsController < MarketController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
