class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path 
    end
  end

  def create
    @form = Form.new(order_params)
    @item = Item.find(params[:item_id])
    if @form.valid?
      @form.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :address, :building,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    unless @item.user_id != current_user.id
      redirect_to root_path
    end
  end

end

