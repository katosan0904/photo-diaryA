FactoryBot.define do
  factory :comment do
    comment   {"aaaaaa"}
    user      {FactoryBot.create :user, email:"category@gmail.com"}
    post      {FactoryBot.create :post}
  end
end