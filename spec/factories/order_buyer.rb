FactoryBot.define do
  factory :order_buyer do
    token           {"tok_abcdefghijk00000000000000000"}
    order_id        {1}
    post_code       {"123-4567"}
    prefecture_id   {2}
    city            {"豊田市"}
    address         { "三角町1-1-1" }
    phone_number    {"09012345678"}
    association :item
    association :user
    
  end
end
