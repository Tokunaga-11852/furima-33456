class UserSettlement
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_area_id, :municipality, :address, :building_name, :phone_number, :buyer_management_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :municipality
    validates :address
    validates :shipment_source_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "phone_number is invalid. not Include hyphen(-). up to 11 characters" }
  end
  
  def save

    # 誰が何を買ったかを保存
    buyer_management = BuyerManagement.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Purchase.create(
      postal_code: postal_code, 
      shipment_source_area_id: shipment_source_area_id, 
      address: address, 
      phone_number: phone_number, 
      building_name: building_name, 
      municipality: municipality, 
      buyer_management_id: buyer_management.id
    )
  end
end
