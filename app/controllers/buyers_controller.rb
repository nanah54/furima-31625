class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_pay = ItemPay.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_pay = ItemPay.new(pay_params)
    if @item_pay.valid?
      @item_pay.save
      redirect_to  root_path
    else
      render action: :index
    end
  end

  private
 def pay_params
  params.require(:item_pay).permit(:postal_code , :prefecture_id , :municipality , :address,  :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
 end
end