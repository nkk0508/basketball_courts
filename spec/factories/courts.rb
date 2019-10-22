FactoryBot.define do
  factory :court do
    court_name { "MyString" }
    image_name { "MyString" }
    monday { false }
    tuesday { false }
    wednesday { false }
    thursday { false }
    friday { false }
    saturday { false }
    sunday { false }
    available_time { "MyString" }
    categories { "MyString" }
    non_residents { false }
    personal_use { false }
    group_use { false }
    address { "MyString" }
    location_information { "MyString" }
    access_count { 1 }
    favorite_count { 1 }
    description { "MyText" }
  end
end
