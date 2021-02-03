class UserSettlement
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_area_id, :municipality, :address, :building_name, :phone_number, :buyer_management_id, :user_id, :item

  with_options presence: true do
    validates :municipality
    validates :address
    validates :shipment_source_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /^\d{11}$/, message: "phone_number is invalid. not Include hyphen(-). up to 11 characters" }
  end


  def save
    # 住所の情報を保存
    Purchase.create(postal_code: postal_code, shipment_source_area_id: shipment_source_area_id, address: address, phone_number: phone_number, building_name: building_name, municipality: municipality,user_id: user.id)
    # 寄付金の情報を保存
    BuyerManagement.create( user_id: user.id)
  end
end
# card_information: card_information, expiration_date: expiration_date, security_code: security_code,
