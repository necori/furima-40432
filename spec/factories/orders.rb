FactoryBot.define do
  factory :order do
    user
    item
    price { 3000 } 
    token { "tok_abcdefghijk00000000000000000" }
  end
end