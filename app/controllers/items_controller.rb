class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]

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
    @items=Item.all.order('created_at DESC')
  end

  def show

  end

  def edit

  end
  def update
    if @item.update(item_params)
      redirect_to root_path
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
    params.require(:item).permit(:name,:text,:audio,:category_id,:url,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
