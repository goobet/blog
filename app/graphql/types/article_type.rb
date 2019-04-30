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
      argument :limit, Int, required: false, default_value: 20
      argument :offset, Int, required: false, default_value: 0

      complexity ->(_ctx, args, child_complexity) { args[:limit] * child_complexity }
    end

    def comments(limit:, offset:)
      object.comments
            .order(:id)
            .offset(offset)
            .limit(limit)
    end
  end
end
