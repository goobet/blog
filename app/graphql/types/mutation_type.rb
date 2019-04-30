# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :createArticle, mutation: Mutations::CreateArticle
    field :updateArticle, mutation: Mutations::UpdateArticle
    field :createComment, mutation: Mutations::CreateComment
    field :signIn, mutation: Mutations::SignIn
    field :signUp, mutation: Mutations::SignUp
    field :signOut, mutation: Mutations::SignOut
  end
end
