FactoryBot.define do
  factory :item do
    product        {Faker::Lorem.sentence}
    description    {Faker::Lorem.sentence}
    category_id    {1}
    condition_id   {1}
    burden_id      {1}
    area_id        {1}
    deliveryday_id {1}
    price          {2000}
    association    :user
  end
end
