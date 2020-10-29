class OrdersController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.save
    redirect_to action: :index
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end
end
