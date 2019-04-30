# frozen_string_literal: true

ADMIN = User.create!(email: 'joe@mail.com',
                     password: 'qwer1234',
                     password_confirmation: 'qwer1234',
                     role: :admin)

USER = User.create!(email: 'simple@mail.com',
                    password: 'qwer1234',
                    password_confirmation: 'qwer1234',
                    role: :user)

FAKE_ADMIN_ARTICLES = Array.new(5) do
  { title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraphs.join("\n"),
    author: ADMIN }
end

FAKE_USER_ARTICLES = Array.new(5) do
  { title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraphs.join("\n"),
    author: USER }
end

Article.create!(FAKE_USER_ARTICLES)
admin_articles = Article.create!(FAKE_ADMIN_ARTICLES)

USER_COMMENTS = Array.new(20) do
  { text: Faker::Movies::StarWars.quote,
    user: USER }
end

admin_articles.first.comments.create!(USER_COMMENTS)
