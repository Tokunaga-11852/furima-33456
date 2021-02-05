class SettlementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:create, :index, :conditions]
  before_action :conditions

  def index
    @settlement = UserSettlement.new
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    @settlement = UserSettlement.new(settlement_params)
    if @settlement.valid?
      pay_item
      @settlement.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def settlement_params
    params.require(
      :user_settlement
    ).permit(:price, 
      :postal_code, 
      :shipment_source_area_id, 
      :municipality, 
      :address, 
      :building_name, 
      :phone_number
    ).merge(
      user_id: current_user.id, 
      item_id: params[:item_id], 
      token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: settlement_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def conditions
    if current_user.id == @item.user_id || @item.buyer_management != nil
      redirect_to root_path
    end
  end
end

