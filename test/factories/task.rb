FactoryGirl.define do
  factory :task do
    sequence(:title) { |n| "Do this thing #{n}" }
  end
end
