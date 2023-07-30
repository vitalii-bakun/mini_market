module Market
  class SessionCartController < BaseController
    before_action :authenticate_market_user!
    before_action :create_cart, only: %i[add]

    def index
      @carts = Cart.take_all(session_products)
    end

    def add
      if @cart.save(session_products)
        render json: { message: t('.success'), quantity: Cart.total_quantity(session_products), type: 'success' },
               status: :created
      else
        render json: { message: t('.error'), type: 'danger' },
               status: :unprocessable_entity
      end
    end

    def destroy
      session_products.delete(params[:product_id])
      redirect_to cart_path, notice: t('.success')
    end

    def destroy_all
      session_products.clear
      redirect_to root_path, notice: t('.success')
    end

    private

    def create_cart
      @cart = Cart.create(cart_params)
    end

    def cart_params
      params.permit(:product_id, :quantity)
    end
  end
end
