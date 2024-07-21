FactoryBot.define do
  factory :item do
    product_name            { Faker::JapaneseMedia::Doraemon.gadget }
    product_description     { Faker::Lorem.sentence }
    category_id             { Faker::Number.within(range: 2..11) }
    condition_id            { Faker::Number.within(range: 2..7) }
    shipping_id             { Faker::Number.within(range: 2..3) }
    prefecture_id           { Faker::Number.within(range: 2..48) }
    duration_id             { Faker::Number.within(range: 2..4) }
    price                   { Faker::Number.within(range: 300..9_999_999) }
    
    association :user
   
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 
  end
end