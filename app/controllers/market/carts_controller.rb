module Market
  class CartsController < BaseController
    def index
      @carts = user_carts
    end

    def create
      user_carts.find_or_create_by(product_id: params[:product_id])
                .update(quantity: params[:quantity])
      render_add :created
    end

    def update
      user_carts.find_by(product_id: params[:product_id]).update(quantity: params[:quantity])
      render_table
    end

    def destroy
      user_carts.find_by(product_id: params[:product_id])
                .destroy
      render_table
    end

    def destroy_all
      user_carts.destroy_all
      render_table
    end

    private

    def user_carts
      current_market_user.carts
    end

    def render_add(status)
      render partial: 'add', layout: false, status:
    end

    def render_table(status = :ok)
      render partial: 'table', locals: { carts: current_market_user.carts }, layout: false, status:
    end
  end
end
