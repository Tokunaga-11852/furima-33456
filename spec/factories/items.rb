FactoryBot.define do
  factory :item do
    item_name {"test投稿"}
    item_information {"テスト商品です"}
    category_id {2}
    item_condition_id {2}
    shipping_charge_id {2}
    shipment_source_area_id {2}
    days_to_ship_id {2}
    price {10000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
