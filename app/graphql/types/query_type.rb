# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :articles, [ArticleType], null: false do
      description 'All articles'
    end

    def articles
      Pundit.policy_scope(current_user, Article)
    end

    field :article, ArticleType, null: true do
      argument :id, ID, 'Get article by id', required: false
    end

    def article(id:)
      Pundit.policy_scope(current_user, Article).find(id)
    end

    field :me, UserType, null: true

    def me
      current_user
    end

    private

    def current_user
      context[:current_user]
    end
  end
end
