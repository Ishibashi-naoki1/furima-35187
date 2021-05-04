FactoryBot.define do
  factory :order_buyer do
    order_id         {1}
    item_id        {1}
    user_id         {1}
    price           {2000}
    post_code       {"123-4567"}
    prefecture_id   {2}
    city            {"豊田市"}
    address { "三角町1-1-1" }
    phone_number    {"09012345678"}
    # association :buyer
    
  end
end
