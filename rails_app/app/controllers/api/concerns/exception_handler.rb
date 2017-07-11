module Api::Concerns
  module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ message: e.message }, :nternal_server_error)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ message: e.message }, :unprocessable_entity)
      end

      rescue_from ActionController::ParameterMissing do |e|
        json_response({ message: e.message }, :bad_request)
      end

      rescue_from MyException::NotAuthorizedException do |e|
        json_response({ message: e.message },  :unauthorized)
      end
    end
  end
end
