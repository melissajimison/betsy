class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def product
    @user = User.find(params[:id])
    @products_by_user = Product.where(user_id: @user.id)
  end

  private

  def user_create_params
    params.permit(user: [:username, :email, :password, :password_confirmation])
  end

end
