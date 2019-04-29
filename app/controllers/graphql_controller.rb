# frozen_string_literal: true

class GraphqlController < ApplicationController
  before_action :authenticate_api_user
  # before_action :authenticate_user!

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    result = BlogSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: { error: { message: error.message, backtrace: error.backtrace }, data: {} },
           status: :internal_server_error
  end

  def authenticate_api_user
    aud = Warden::JWTAuth::EnvHelper.aud_header(request.env)
    user = Warden::JWTAuth::UserDecoder.new.call(current_token, :user, aud)
    sign_in(:user, user)
  rescue JWT::DecodeError
    nil
  end

  def current_token
    Warden::JWTAuth::HeaderParser.from_env(request.env)
  end

  def context
    { current_user: current_user, current_token: current_token }
  end
end
