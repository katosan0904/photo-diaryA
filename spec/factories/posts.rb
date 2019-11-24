FactoryBot.define do
  factory :post do
    text      {"テスト"}
    title     {"テスト"}
    place     {"神奈川"}
    image     {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'))}
    user      {FactoryBot.create :user}
    category  {FactoryBot.create :category}
  end
end