FactoryBot.define do
  factory :contact do
    name { "Dummy Name" }
    birthdate { "20211023" }
    phone { "(+01) 123 456 78 90" }
    address { "Colina Alta COVA 2 Monterrey MX" }
    credit_card { "************1234" }
    franchise { "Visa" }
    email { |n| "contact#{n}@mail.com" }
  end
end
