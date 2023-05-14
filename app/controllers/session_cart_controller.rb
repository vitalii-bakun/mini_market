class SessionCartController < MarketController
  def index
    @carts = Cart.take_all(session_products)
  end

  def add
    cart = Cart.create(cart_params)

    redirect_to root_path, cart.save(session_products) ? { notice: t('.success') } : { alert: t('.error') }
  end

  def update
    cart = Cart.create(cart_params)

    redirect_to cart_path, cart.update(session_products) ? { notice: t('.success') } : { alert: t('.error') }
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

  def cart_params
    params.permit(:product_id, :quantity)
  end
end
