class OrdersController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
  end
end
