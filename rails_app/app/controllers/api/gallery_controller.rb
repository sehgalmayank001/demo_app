class Api::GalleryController < Api::ApiController
  def create
    image = Image.new(image_upload_params)
    raise MyException::NotAuthorizedException unless request.headers['Authorization'] == User.find(image.user_id).auth_token
    if image.save
      render json:{ data:image, message: "Succesful", status: "Success" }, status: 200
    else
      render json: { message: image.errors, status: "failure" }, status: 500
    end
  end

  def show
    image=Image.find(params[:id])
      render json: { data:image, message: 'Successful', status: "Success"}, status: 200
  end

  private
  def image_upload_params
    params.require(:image_uploaded).permit(:name ,:image,:user_id)
  end
end
