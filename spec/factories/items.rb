FactoryBot.define do
  factory :item do
    title              {"商品"}
    description        {"これは良い商品です。"}
    category_id        {2}
    status_id          {2}
    delivery_charge_id {2}
    area_id            {2}
    delivery_day_id    {2}
    price              {"1000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/time.png'), filename: 'time.png')
    end
  end
end
