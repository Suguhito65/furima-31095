class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == Item.find(params[:item_id]).user_id || Item.find(params[:item_id]).order
      redirect_to root_path
    end
  end
end
