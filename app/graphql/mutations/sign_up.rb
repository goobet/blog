# frozen_string_literal: true

module Mutations
  class SignUp < BaseMutation
    include ErrorsHandling

    field :node, Types::UserType, null: true

    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    def resolve(user_attributes)
      user = User.create(user_attributes)
      handle_validation_errors(user)
    end
  end
end
