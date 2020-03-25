FactoryBot.define do

  factory :item do
    name                  {"トマト"}
    item_description      {"美味しい"}
    category_id           {"1"}
    item_condition_id     {"1"}
    postage_payer_id      {"1"}
    prefecture_id         {"1"}
    preparation_day_id    {"1"}
    price                 {"500"}
  end

  factory :item_image do
    image                 {"sample.jpg"}
  end

end