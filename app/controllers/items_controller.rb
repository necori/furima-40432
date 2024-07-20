class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
    
 def index
  #@item = Item.all
 end

 def new
  @item = Item.new
end

 def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to '/'
   else
    render :new, status: :unprocessable_entity
   end
 end

 private
 
   def item_params
    params.require(:item).permit(:product_name,:product_description, :category_id, :condition_id, :shipping_id, :prefecture_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end
 end