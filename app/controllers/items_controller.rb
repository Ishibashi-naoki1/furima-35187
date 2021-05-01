class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update]
  
  def index
     @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(items_params)
    if  @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  # def destroy
  #   item = Item.find(params[:id])
  #   if item.destroy
  #     redirect_to root_path
  #   end
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:item_name,:image,:price,:condition, :category_id,:prefecture_id,:carriage_id,:brand_id,:ship_date_id).merge(user_id: current_user.id)
  end
  def contributor_confirmation  
    redirect_to root_path unless current_user == @item.user
  end
end
