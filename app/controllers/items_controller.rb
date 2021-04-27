class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
      @item = Item.includes(:user)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_singed_in?
      redirect_to toot_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:item_name,:image,:price,:condition).merge(user_id: current_user.id)
  end
end
end