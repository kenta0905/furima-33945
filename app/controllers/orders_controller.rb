class OrdersController < ApplicationController

def index
  @form = Form.new(post: @post)
end

def create
  # Order.create(order_params)
end

# private
# def order_params
#   params.require(:order).permit(:item, :user).merge(user_id: current_user.id)
# end

end
