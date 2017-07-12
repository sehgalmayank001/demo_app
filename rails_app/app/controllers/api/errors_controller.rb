class Api::ErrorsController < Api::ApiController
  def show
     render json:{message: "invalid route or method" } , status: :not_found
  end

  def bad
     render json:{message: "invalid CONTENT_TYPE" } , status: :not_acceptable
  end
end
