module Api::Concerns
  module ExceptionHandler
    # provides the more graceful `included` method
    extend ActiveSupport::Concern

    included do
      # rescue_from ActiveRecord::RecordNotFound do |e|
      #   json_response({ message: e.message }, :internal_server_error)
      # end
      #
      # rescue_from ActiveRecord::RecordInvalid do |e|
      #   json_response({ message: e.message }, :unprocessable_entity)
      # end

      rescue_from ActionController::ParameterMissing do |e|
        json_response2(e.message,"failure","500",:internal_server_error)
      end

      rescue_from MyException::NotAuthorizedException do |e|
        json_response({ message: e.message },  :unauthorized)
      end
    end
  end
end
