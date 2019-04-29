# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = ->(context) { "Bearer #{context.cookies['_graphql_token']}" }
