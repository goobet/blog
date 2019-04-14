# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :articles, [ArticleType], null: false do
      description 'All articles'
    end

    def articles
      Article.all
    end

    field :article, ArticleType, null: true do
      argument :id, ID, 'Get article by id', required: false
    end

    def article(id:)
      Article.find(id)
    end
  end
end
