# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :author, Types::UserType, null: false
  end
end
