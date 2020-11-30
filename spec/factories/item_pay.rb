FactoryBot.define do
  factory :item_pay do
    postal_code                  { '123-4567' }
    prefecture_id                { 14 }
    municipality                 { '千代田区' }
    address                      { '千代田１−１' }
    building_name                {  }
    phone_number                 { '09012345678' }
  
  end
end