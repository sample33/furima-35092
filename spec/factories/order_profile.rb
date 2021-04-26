FactoryBot.define do
  factory :order_profile do
    token          {"tok_abcdefghijk00000000000000000"}
    zip            {"123-4567"}
    area_id        {2}
    city           {"市町村"}
    address        {"住所1-1"}
    building       {""}
    tel            {"01234567890"}
  end
end
