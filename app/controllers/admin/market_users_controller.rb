module Admin
  class MarketUsersController < BaseController
    before_action :set_market_user, only: %i[show edit update destroy]
    def index
      @market_users = MarketUser.all
    end

    def show; end

    def edit; end

    def update
      if @market_user.update(market_user_params)
        redirect_to admin_market_user_path(@market_user),
                    notice: t('.success')
      else
        redirect_to edit_admin_market_user_path(@market_user),
                    alert: @market_user.errors.full_messages
      end
    end

    def new
      @market_user = MarketUser.new
    end

    def create
      @market_user = MarketUser.new(market_user_params)

      if @market_user.save
        redirect_to admin_market_user_path(@market_user),
                    notice: t('.success')
      else
        redirect_to new_admin_market_user_path,
                    alert: @market_user.errors.full_messages
      end
    end

    def destroy
      @market_user.destroy

      redirect_to admin_market_users_path,
                  notice: t('.success')
    end

    private

    def set_market_user
      @market_user = MarketUser.find(params[:id])
    end

    def market_user_params
      params.require(:market_user)
            .permit(:email,
                    :password,
                    :password_confirmation,
                    :first_name,
                    :address,
                    :phone)
    end
  end
end
