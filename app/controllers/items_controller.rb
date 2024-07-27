class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, except:[:index, :show, :new, :create, :destroy]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
    
 def index
  @items = Item.all.order('created_at DESC')
 end

 def show
 end

 def new
  @item = Item.new
 end

 def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
 end

 def edit
 end

 def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
  end
end

def destroy
   @item.destroy
  redirect_to root_path
end

 private
 
  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :condition_id, :shipping_id, :prefecture_id, :duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    @item = Item.find(params[:id])
    return if user_signed_in? && (current_user.id == @item.user.id)

    redirect_to action: :index

  end
  end