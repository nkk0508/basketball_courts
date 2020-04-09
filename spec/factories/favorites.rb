FactoryBot.define do
  factory :favorite do
    user_id { 1 }
    court_id { 1 }
    user
    court
  end
end
