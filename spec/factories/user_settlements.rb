FactoryBot.define do
  factory :user_settlement do
    postal_code { '123-4567' }
    shipment_source_area_id { 2 }
    municipality { '北海道市' }
    address { '青木1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
