FactoryBot.define do
    factory :user do
      id {1}
      email { Faker::Internet.free_email}
      randPassword = Faker::Internet.password(min_length: 6) 
      password {randPassword}
      password_confirmation {randPassword}
    end
end