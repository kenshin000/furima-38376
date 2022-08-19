FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.initials(number: 2)}
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name   {'なまえ'}
    last_name   {'みょうじ'}
    first_name_kana  {'ナマエ'}
    last_name_kana   {'ミョウジ'}
    birthday { Faker::Date.backward }
  end
end