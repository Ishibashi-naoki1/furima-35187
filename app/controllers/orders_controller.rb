class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user == @item.user || @item.order.present?
    redirect_to root_path
    end
    @order_buyer = OrderBuyer.new
  end

  def new
  end

  def create
    @order_buyer = OrderBuyer.new(order_buyer_params)
    if @order_buyer.valid? 
           pay_item
           @order_buyer.save
           return redirect_to root_path
        else
          render :index
        end         
  end

  private
  def order_buyer_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end