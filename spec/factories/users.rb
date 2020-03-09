FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"阿部"}
    last_name             {"太郎"}
    first_kana            {"あべ"}
    last_kana             {"たろう"}
    birth_year            {"1990"}
    birth_month           {"01"}
    birth_day             {"01"}
  end

  factory :sending_destination do
    post_code              {"0000000"}
    prefecture             {"福岡市"}
    city                   {"博多区"}
    house_number           {"00000000"}
    building_name          {""}
    phone_number           {""}
  end
  
end