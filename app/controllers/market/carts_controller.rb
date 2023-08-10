module Market
  class CartsController < BaseController
    before_action :set_cart, only: %i[update destroy]

    def index
      @carts = user_carts
    end

    def add
      user_carts.find_or_create_by(product_id: params[:product_id])
                .update(quantity: 1)
      redirect_to root_path, notice: t('.success')
    end

    def remove
      user_carts.find_by(product_id: params[:product_id])
                .destroy
      redirect_to root_path, notice: t('.success')
    end

    def update
      if @cart.update(quantity: params[:quantity])
        redirect_to cart_path, notice: t('.success')
      else
        redirect_to cart_path, alert: t('.error')
      end
    end

    def destroy
      @cart.destroy
      redirect_to cart_path, notice: t('.success')
    end

    def destroy_all
      user_carts.destroy_all
      redirect_to cart_path, notice: t('.success')
    end

    private

    def set_cart
      @cart = user_carts.find_by(product_id: params[:product_id])
    end

    def user_carts
      current_market_user.carts
    end
  end
end
