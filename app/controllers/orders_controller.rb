class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new 
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new(order_buyer_params)
        if @order_buyer.valid?
          @order_buyer.save
        elsif @order = Order.new(order_params)
          @order.valid?
          @order.save
          return redirect_to root_path
        else
          render :index
        end

  end
  
  private
  def order_buyer_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end

  def order_params
    params.require(:order).permit(:price)
  end
end
