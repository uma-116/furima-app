FactoryBot.define do
  factory :item do
    name          {"Tシャツ"}
    detail        {"詳細です"}
    condition_id  {2}
    categoy_id    {5}
    price         {1000}
    fee_id        {1}
    shipping_id   {1}
    brand         {"シャネル"}
    created_at    { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end