FactoryBot.define do
  factory :purchase do
    postal_code   {'123-4567'}
    prefecture    {1}
    city          {'北海道'}
    house_number  {'1-1'}
    building_name {'札幌ハイツ'}
    phone_number  {'09012345678'}
  end
end