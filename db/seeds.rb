# frozen_string_literal: true

AUTHOR = User.create(email: 'joe@mail.com',
                     password: 'qwer1234',
                     password_confirmation: 'qwer1234')

FAKE_ARTICLES = Array.new(10) do
  { title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraphs.join("\n"),
    author: AUTHOR }
end

Article.create!(FAKE_ARTICLES)
