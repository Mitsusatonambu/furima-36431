FactoryBot.define do
  factory :order_address do
    postal_code   {'123-4567'}
    prefecture_id   { 2 }
    city          { '札幌市' }
    house_number  { '中央1-1-1'}
    building      { '札幌ビル' }
    phone_number  { '09012345678' }
    token         { 'sk_test_2d6b780dd5d08cd9c07d3791' }
  end
end
