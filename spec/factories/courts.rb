FactoryBot.define do
  factory :court do
    name { "テスト体育館" }
    monday { false }
    tuesday { false }
    wednesday { false }
    thursday { false }
    friday { false }
    saturday { false }
    sunday { false }
    categories { "MyString" }
    non_residents { "MyString" }
    postal_code { "MyString" }
    address { "東京都品川区東五反田2-11-2" }
    location_information { "MyString" }
    access_count { 1 }
    favorite_count { 1 }
    charge { 1 }
    url { "MyString" }
    image { "MyString" }
    description { "MyText" }
    phone_number { "MyText" }
    station { "MyText" }
  end
end
