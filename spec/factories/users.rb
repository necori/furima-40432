  FactoryBot.define do
    factory :user do
      
      nickname              { Faker::Name.initials(number: 2) }
      email                 { Faker::Internet.email }
      password              { Faker::Internet.password(min_length: 6) + '1a' }
      password_confirmation { password }
      last_name             { "山田" }
      first_name            { "幸子" }
      read_last             { "ヤマダ" }
      read_first            { "サチコ" }
      birth_day             { Faker::Date.backward }
    end
  end
