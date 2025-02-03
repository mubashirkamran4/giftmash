FactoryBot.define do
  factory :gift do
    name { "Random Gift" }
    image_url { "http://example.com/image.jpg" }
    url { "http://example.com/gift" }
    upvotes { 0 }
    downvotes { 0 }
  end
end