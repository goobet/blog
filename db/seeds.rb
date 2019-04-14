# frozen_string_literal: true

FAKE_ARTICLES = Array.new(10) do
  { title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraphs.join("\n") }
end

Article.create!(FAKE_ARTICLES)
