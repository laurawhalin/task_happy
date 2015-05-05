FactoryGirl.define do
  factory :list do
    sequence(:title) { |n| "List #{n}" }
  end
end
