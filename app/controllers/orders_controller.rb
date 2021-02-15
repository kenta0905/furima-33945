class OrdersController < ApplicationController

def index
  @form = Form.new
end

def create
  @form = Form.new(order_params)
  if @form.valid?
    @form.save
    redirect_to root_path
  else
    render :index
  end
end

private

def order_params
  params.require(:form).permit(:postal_code, :prefecture_id, :city, :address, :building,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
end

end
