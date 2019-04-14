# frozen_string_literal: true

module Mutations
  class CreateArticle < BaseMutation
    field :article, Types::ArticleType, null: true

    argument :title, String, required: true
    argument :content, String, required: true

    def resolve(article_attributes)
      { article: Article.create!(article_attributes) }
    end
  end
end
