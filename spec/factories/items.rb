FactoryBot.define do
  factory :item do
    name  {Faker::Name.initials(number: 2)}
    item_explain  {'商品説明'}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category { Category.all.sample }
    situation { Situation.all.sample }
    area { Area.all.sample }
    send_day { SendDay.all.sample }
    send_load { SendLoad.all.sample }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
