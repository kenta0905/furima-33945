FactoryBot.define do
  factory :order do
    postal_code           { "123-4567" }
    prefecture_id         { 1 }
    city                  { "東京都中央区" }
    address               { "中崎3-1" }
    phone_number          { "09012345678" }
  end
end
