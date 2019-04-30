# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :user, Types::UserType, null: false, preload: :user
    field :article, Types::ArticleType, null: false, preload: :article
  end
end
