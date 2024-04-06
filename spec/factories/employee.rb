FactoryBot.define do
  factory :employee, class: 'Employee' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    department { Faker::Commerce.department(max: 1) }
    salary { Faker::Number.between(from: 30000, to: 100000) }
  end
end