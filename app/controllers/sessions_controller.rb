class SessionsController < ApplicationController
  # guests
  def create_order
    @order = Order.create
    @order.update(completion_status: "pending")
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  # logged in users
  def create
    # this is for creating a new session after login
    user = User.log_in(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  #logout
  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_path
  end
end
