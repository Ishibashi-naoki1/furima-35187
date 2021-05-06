FactoryBot.define do
  factory :buyer do
    post_code       {"123-4567"}
    prefecture_id   {2}
    city            {"愛知県"}
    address { "三角町1-1-1" }
    phone_number    {"09012345678"}
  end
end
