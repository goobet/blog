# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin?

      scope.published
    end
  end

  def update?
    user.admin? || user == record.author && !record.published
  end
end
