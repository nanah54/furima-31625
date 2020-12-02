class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    if current_user.id != @item.user_id || @item.buyer.present?
      redirect_to root_path
    @item_pay = ItemPay.new
  end

  def create
    @item_pay = ItemPay.new(pay_params)
    if @item_pay.valid?
      payjps
      @item_pay.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_params
    params.require(:item_pay).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  

  def payjps
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: pay_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
