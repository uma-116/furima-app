FactoryBot.define do
  factory :item do
    name                   {"キャベツ"}
    detail                 {"採れたて"}
    condition              {"2"}
    price                  {"33333"}
    postage                {"2"}
    ship_from              {"2"}
    ship_date              {"2"}
    # accepts_neseted_attributes_for を使った場合、以下のように書かないとエラーになります。
    images                 { [build(:image)] }

  end
end