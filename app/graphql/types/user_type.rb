# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :articles, [Types::ArticleType], null: false, preload: :articles
  end
end
