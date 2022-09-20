FactoryBot.define do
  factory :user do
    name { "My Name" }
    email { "test@example.com" }
    password {"hogehoge"}
    password_confirmation {"hogehoge"}
  end
end
