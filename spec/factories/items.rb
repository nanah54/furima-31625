FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    title { '商品名' }
    concept { '説明文' }
    category_id { 3 }
    usage_status_id { 3 }
    postage_id { 2 }
    shipment_source_id { 3 }
    date_of_shipment_id  { 2 }
    price { 300 }
    association :user
  end
end
