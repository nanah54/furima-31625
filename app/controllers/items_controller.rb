class ItemsController < ApplicationController

  def edit
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:title, :image).merge(user_id: current_user.id)
  end

end
