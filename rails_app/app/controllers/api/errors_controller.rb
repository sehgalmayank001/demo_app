class Api::ErrorsController < Api::ApiController
  def show
     render json:{message: "invalid route or method" } , status: :not_found
  end

  def bad_format
     render json:{message: "invalid format" } , status: :not_acceptable
  end
end
