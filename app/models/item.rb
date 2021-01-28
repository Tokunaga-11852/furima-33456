class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :item_condition
  belongs_to :shipment_source_area
  belongs_to :shipping_charge

  with_options presence: true do
    # validates :category
    # validates :item_condition
    # validates :day_to_ship
    # validates :shipment_source_area
    # validates :shipping_charge
    validates :item_name 
    validates :item_information
    validates :price, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

  end
  belongs_to :user
  has_one :buyer_management
  has_one_attached :image
end