# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    include ErrorsHandling

    field :node, Types::CommentType, null: true

    argument :article_id, ID, required: true
    argument :text, String, required: true

    def resolve(comment_attributes)
      comment = Comment.create(comment_attributes.merge(user: current_user))
      handle_validation_errors(comment)
    end
  end
end
