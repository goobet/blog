# frozen_string_literal: true

module Mutations
  class CreateArticle < BaseMutation
    include ErrorsHandling

    field :node, Types::ArticleType, null: true

    argument :title, String, required: true
    argument :content, String, required: true

    def resolve(article_attributes)
      article = Article.create(article_attributes.merge(author: current_user))
      handle_validation_errors(article)
    end
  end
end
