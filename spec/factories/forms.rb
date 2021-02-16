FactoryBot.define do
  factory :form do
    postal_code           { "123-4567" }
    prefecture_id         { 2 }
    city                  { "東京都中央区" }
    address               { "中崎3-1" }
    phone_number          { "09012345678" }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
