FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    item_name          {"名前"}
    condition          {"説明"}
    category_id        {2}
    brand_id           {2}
    carriage_id        {2}
    prefecture_id      {2}
    ship_date_id       {2}
    price           {2000}
    association :user
  end
end