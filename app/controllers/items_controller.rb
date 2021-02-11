class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order("created_at DESC")
  end

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

  def show
  end
  
  def edit
    unless current_user.id == @item.user_id
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end    
  end


  def set_item
    @item = Item.find(params[:id])
  end

  
  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_id, :prefecture_id, :scheduled_id, :price, :user).merge(user_id: current_user.id)
  end

end
