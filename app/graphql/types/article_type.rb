# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :published, Boolean, null: false
    field :image_url, String, null: false
    field :author, Types::UserType, null: false, preload: :author
    field :comments, [Types::CommentType], null: false, preload: :comments do
      argument :limit, Int, required: false
      argument :offset, Int, required: false
    end

    def comments(limit: 20, offset: 0)
      object.comments
            .order(:id)
            .offset(offset)
            .limit(limit)
    end
  end
end
