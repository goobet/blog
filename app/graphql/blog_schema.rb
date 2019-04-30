# frozen_string_literal: true

class BlogSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  max_complexity 100
  max_depth 10

  use GraphQL::Batch
  enable_preloading

  log_query_complexity = GraphQL::Analysis::QueryComplexity.new do |_query, complexity|
    Rails.logger.info("[GraphQL Query Complexity] #{complexity}")
  end
  query_analyzer(log_query_complexity)
  log_query_depth = GraphQL::Analysis::QueryDepth.new do |_query, depth|
    Rails.logger.info("[GraphQL Query Depth] #{depth}")
  end
  query_analyzer(log_query_depth)
end
