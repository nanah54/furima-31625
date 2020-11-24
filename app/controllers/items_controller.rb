class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :category_id, :usage_status_id, :postage_id, :shipment_source_id, :date_of_shipment_id, :concept, :user).merge(user_id: current_user.id)
  end
end
