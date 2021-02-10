FactoryBot.define do
  factory :item do
    association :user
    name              {"名前"}
    info              {"情報"}
    category_id       { 2 }
    status_id         { 2 }
    shipping_id       { 2 }
    prefecture_id     { 2 }
    scheduled_id      { 2 }
    price             { 980 }
   
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.jpg')
    end
  end
end
