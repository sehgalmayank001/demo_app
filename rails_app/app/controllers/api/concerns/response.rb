module Api::Concerns
  module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end
    def json_response2(message , status_m ,code , status = :ok)
      render json: {message: message, status: status_m, code: code}, status: status
    end
  end
end
