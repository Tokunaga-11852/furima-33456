class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :definition, only: [:edit, :show, :conditions, :update]
  before_action :conditions, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else 
      render :show
    end
  end
  

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_information, :category_id, :item_condition_id, :shipping_charge_id, :shipment_source_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def definition
    @item = Item.find(params[:id])
  end

  def conditions
    unless current_user.id == @item.user_id
    redirect_to action: :index
    end
  end

end
