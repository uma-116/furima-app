FactoryBot.define do
  factory :item do
    name          {"Tシャツ"}
    detail        {"詳細です"}
    condition     {2}
    categoy_id    {5}
    price         {1000}
    postage       {1}
    ship_from     {1}
    ship_date     {1}
    brand         {"シャネル"}
    created_at    { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end