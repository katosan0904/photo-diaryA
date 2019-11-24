FactoryBot.define do
  factory :category ,class: Category do
    sequence(:category) { |n| "test#{n}"  } 
  end
end