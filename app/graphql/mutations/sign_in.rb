# frozen_string_literal: true

module Mutations
  class SignIn < BaseMutation
    field :token, String, null: true

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      user = authenticate(email, password)
      { token: generate_token(user) } if user
    end

    private

    def authenticate(email, password)
      user = User.find_for_database_authentication(email: email)
      user if user.valid_password?(password)
    end

    def generate_token(user)
      token, payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
      user.on_jwt_dispatch(token, payload) if user.respond_to?(:on_jwt_dispatch)

      token
    end
  end
end
