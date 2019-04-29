# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    object_class Types::BaseObject
    input_object_class Types::BaseInputObject

    private

    def current_user
      context[:current_user]
    end
  end
end
