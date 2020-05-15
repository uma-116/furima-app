FactoryBot.define do

  factory :user do
    firstname             {"佐藤"}
    lastname              {"太郎"}
    firstname_kana        {"サトウ"}
    lastname_kana         {"タロウ"}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birth_year            {"1992"}
    birth_month           {"11"}
    birth_day             {"20"}
    phone_number          {"09012345678"}
  end

end