FactoryBot.define do
  factory :item do
    name  { Faker::Name.initials(number: 2) }
    item_explain { '商品説明' }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 2 }
    situation_id { 2 }
    area_id { 2 }
    send_day_id { 2 }
    send_load_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
