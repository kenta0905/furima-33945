class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end


  # def create
  #   @article = Article.new(article_params)
  #   if @article.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  
  private

  def item_params
    params.require(:item).permit(:name,:info,:category_id,:sales_status_id,:shipping_id,:prefecture_id,:scheduled_id,:price,:user)
  end


end