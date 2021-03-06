# frozen_string_literal: true

module Mutations
  module ErrorsHandling
    extend ActiveSupport::Concern
    UNAUTHORIZED_MESSAGE = 'Unauthorized'

    included do
      field :errors, [Types::ValidationErrorType], null: false
    end

    def handle_validation_errors(record)
      return { node: record, errors: [] } if record.valid?

      prepared_errors = record.errors.map do |attribute, message|
        { field: attribute.to_s.camelize(:lower), message: message }
      end

      { errors: prepared_errors }
    end

    def handle_unauthorized
      { errors: [{ field: 'base', message: UNAUTHORIZED_MESSAGE }] }
    end
  end
end
