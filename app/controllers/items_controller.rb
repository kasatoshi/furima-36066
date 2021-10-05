class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :show, :index, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end


  def show
  end


  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end






  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :product_id, :shipping_cost_id, :delivery_id, :shipping_day_id, :price, :image, :product_condition_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end


end



