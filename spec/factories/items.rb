FactoryBot.define do
  factory :item do
    association :user
    name {'ゲームソフト'}
    info {'任天堂のゲームソフトです'}
    category_id { 2 }
    status_id  { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    delivery_date_id { 2 }
    price { 444 }
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/img_3358.jpg'), filename: 'img_3358.jpg', content_type: 'image/jpg')
    end
  end
end
