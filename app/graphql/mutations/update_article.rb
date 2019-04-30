# frozen_string_literal: true

module Mutations
  class UpdateArticle < BaseMutation
    include ErrorsHandling

    field :node, Types::ArticleType, null: true

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :content, String, required: false
    argument :published, Boolean, required: false

    def resolve(id:, **article_attributes)
      article = Article.find(id)
      if Pundit.policy(context[:current_user], article).update?
        article.update(article_attributes)
        return handle_validation_errors(article)
      end

      handle_unauthorized
    end
  end
end
