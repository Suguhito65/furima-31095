class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.id)
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :condition_id, :burden_id, :area_id, :deliveryday_id, :price).merge(user_id: current_user.id)
  end
end
