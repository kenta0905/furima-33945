class OrdersController < ApplicationController

def index
  @form = Form.new
end

def create
  @form = Form.new(order_params)
end

private

def order_params
  params.require(:form).permit(:postal_code, :prefecture, :city, :address, :building,:phone_number,:item).merge(user_id: current_user.id)
end

end
