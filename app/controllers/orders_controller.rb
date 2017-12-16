class OrdersController < ApplicationController
  def index
    @orders = current_user.my_orders
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to activity_order_url(@activity, @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        flash[:alert] = @order.errors.full_messages.join(', ')
        format.html { render 'activity/show' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit :user_id, :activity_id, :quantity
  end
end
