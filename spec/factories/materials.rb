FactoryGirl.define do
  factory :material do
    name        { Faker::Name.name }
    amount      { Random.rand(999) }
    description { Faker::Lorem.paragraph([2, 3, 4, 5].sample) }
    user
  end

  factory :invalid_material, parent: :material do |f|
    f.user nil
  end
end
