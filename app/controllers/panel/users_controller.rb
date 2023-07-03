class Panel::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to panel_user_path(@user), notice: t('.success')
    else
      redirect_to edit_panel_user_path(@user), alert: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to panel_user_path(@user), notice: t('.success')
    else
      redirect_to new_panel_user_path, alert: @user.errors.full_messages
    end
  end

  def destroy
    @user.destroy

    redirect_to panel_users_path, notice: t('.success')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
