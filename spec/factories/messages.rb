FactoryGirl.define do
  factory :message do
    text       {Faker::Lorem.sentence}
    image      {Faker::Lorem.sentence}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    updated_at {Faker::Time.between(Datetime.now - 1, DateTime.now)}
  end
end
