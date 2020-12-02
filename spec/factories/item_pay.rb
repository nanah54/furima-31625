FactoryBot.define do
  factory :item_pay do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code                  { '123-4567' }
    prefecture_id                { 14 }
    municipality                 { '千代田区' }
    address                      { '千代田１−１' }
    building_name                { 'マンション２０３号' }
    phone_number                 { '09012345678' }
  end
end
