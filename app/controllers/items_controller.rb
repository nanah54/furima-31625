class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || !@item.buyer.nil?
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :price, :category_id, :usage_status_id, :postage_id, :shipment_source_id, :date_of_shipment_id, :concept, :user).merge(user_id: current_user.id)
  end
end
