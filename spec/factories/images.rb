FactoryBot.define do
  factory :image do
    img { File.open("#{Rails.root}/public/images/fire_up.png")}
  end
end
