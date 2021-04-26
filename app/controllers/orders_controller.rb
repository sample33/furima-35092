class OrdersController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_item
  before_action  :move_to_index
  def index
    @order_profile = OrderProfile.new
  end

  def create
    @order_profile = OrderProfile.new(order_params)
    if @order_profile.valid?
      pay_item
      @order_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_profile).permit(:zip, :area_id, :city, :address, :building,  :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user || @item.order.present? 
      redirect_to root_path
    end
  end

  
end
