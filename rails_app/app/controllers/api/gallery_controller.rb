class Api::GalleryController < Api::ApiController
  def create
    debugger
    image = Image.new(image_upload_params)
    raise MyException::NotAuthorizedException unless request.headers['Authorization'] == User.find(image.user_id).auth_token
    if image.save
      render json: image, status: 200
    else
      render json: { errors: image.errors, status: "failure" }, status: 500
    end
  end

  def show
    image=Image.find(params[:id])
    if image
      render json: image, status: 200
    else
      render json: { errors: image.errors, status: "failure" }, status: 500
    end
  end

  private
  def image_upload_params
    params.require(:image_uploaded).permit(:name ,:image,:user_id)
  end
end
