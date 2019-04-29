# frozen_string_literal: true

module Mutations
  class SignOut < BaseMutation
    field :success, Boolean, null: true

    def resolve
      { success: sign_out_current_user }
    end

    private

    def sign_out_current_user
      Warden::JWTAuth::TokenRevoker.new.call(current_token) if current_token
    end

    def current_token
      context[:current_token]
    end
  end
end
