class ActivityController < ApplicationController
  def index
    @activities = Activity.all_available
  end

  def show
    @activity = Activity.find(params[:id])
    @order = Order.new
  end
end
