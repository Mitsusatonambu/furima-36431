FactoryBot.define do
  factory :user do
    nickname                  {Faker::Name.name}
    email                     {Faker::Internet.email}
    password                  {'aaa000'}
    password_confirmation     {password}
    family_name               {'山田'}
    first_name                {'太郎'}
    family_name_kana          {'ヤマダ'}
    first_name_kana           {'タロウ'}
    birth_date                {'1964-10-10'}
  end
end