FactoryBot.define do
  factory :order do
    recipient { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone } #查文件
    address { Faker::Address.full_address}  #查文件
    note { Faker::Lorem.sentences }
    status { "MyString" }

    trait :invalid do
      phone { nil } 
      address { nil }      
    end
  end
end
