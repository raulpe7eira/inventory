FactoryGirl.define do

  factory :material do
    user
  end

  factory :valid_material, :parent => :material do |f|
    f.name        { Faker::Name.name }
    f.amount      { Random.rand(999) }
    f.description { Faker::Lorem.paragraph([2, 3, 4, 5].sample) }
  end

  factory :invalid_material, :parent => :material do |f|
    f.id   { 999 }
    f.name { nil }
  end

end
