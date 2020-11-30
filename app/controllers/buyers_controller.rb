class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_pay = ItemPay.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_pay = ItemPay.new(pay_params)
    if @item_pay.valid?
      Payjp.api_key = "sk_test_6ec3c4aa87d530682685c9e9"  
      Payjp::Charge.create(
        amount:@item.price,  # 商品の値段
        card: pay_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @item_pay.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

  private
 def pay_params
  params.require(:item_pay).permit(:postal_code , :prefecture_id , :municipality , :address,  :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
 end
end