class Admin::AdminUsersController < ApplicationController
  before_action :set_admin_user, only: %i[show edit update destroy]

  def index
    @admin_users = AdminUser.all
  end

  def show; end

  def edit; end

  def update
    if @admin_user.update(admin_user_params)
      redirect_to admin_admin_user_path(@admin_user), notice: t('.success')
    else
      redirect_to edit_admin_admin_user_path(@admin_user), alert: @admin_user.errors.full_messages
    end
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    if @admin_user.save
      redirect_to admin_admin_user_path(@admin_user), notice: t('.success')
    else
      redirect_to new_admin_admin_user_path, alert: @admin_user.errors.full_messages
    end
  end

  def destroy
    @admin_user.destroy

    redirect_to admin_admin_users_path, notice: t('.success')
  end

  private

  def set_admin_user
    @admin_user = AdminUser.find(params[:id])
  end

  def admin_user_params
    params.require(:admin_user).permit(:email, :password, :password_confirmation, :role)
  end
end
