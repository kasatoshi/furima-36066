FactoryBot.define do
  factory :item do
    association :user
    product_name          {'ソイジョイSOYJOY'}
    description           {"商品の説明"}
    price                 {33300}
    category_id           {2}
    product_condition_id  {2}
    shipping_cost_id      {2}
    delivery_id           {2}
    shipping_day_id       {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/coffee-6371149_1280.png'), filename: 'coffee-6371149_1280.png')
    end
  end
end