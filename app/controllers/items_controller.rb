class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_information, :category_id, :item_condition_id, :shipping_charge_id, :shipment_source_area_id, :days_to_ship_id, :price)
  end
end
