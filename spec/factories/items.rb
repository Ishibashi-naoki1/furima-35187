FactoryBot.define do
  factory :item do
    item_name          {"名前"}
    condition          {"説明"}
    category_id        {2}
    brand_id           {2}
    carriage_id        {2}
    prefecture_id      {2}
    ship_date_id       {2}
    price           {2000}
    association :user

   after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end