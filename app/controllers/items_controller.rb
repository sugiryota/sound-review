class ItemsController < ApplicationController
 

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def index

  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:audio,:category_id,:url).merge(user_id: current_user.id)
end
