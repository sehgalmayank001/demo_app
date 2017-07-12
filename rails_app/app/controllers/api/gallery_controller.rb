class Api::GalleryController < Api::ApiController
  def create
    if !image_upload_params.has_key?(:name) then raise ActionController::ParameterMissing.new('name') end
    if !image_upload_params.has_key?(:image) then raise ActionController::ParameterMissing.new('image') end
    if !image_upload_params.has_key?(:user_id) then raise ActionController::ParameterMissing.new('user_id') end
    image = Image.new(image_upload_params)
    raise MyException::NotAuthorizedException unless request.headers['Authorization'] == User.find(image.user_id).auth_token
    if image.save
      render json:{ data:image, message: "Succesful", status: "Success" , code: "200"}, status: 200
    else
      render json: { message: image.errors, status: "failure", code: "500"}, status: 500
    end
  end

  def show
    debugger
    unless params[:id] =~ /\A\d+\z/
      render json: { message: "id should only be a number", status: "Failure" ,code: "500"}, status: 500
      return
    end
    image=Image.find(params[:id])
    if image
      render json: { data:image, message: 'Successful', status: "Success", code: "200"}, status: 200
    else
      render json: { message: image.errors, status: "Failure" ,code: "500"}, status: 500
    end
  end

  private
  def image_upload_params
    params.require(:image_uploaded).permit(:name ,:image,:user_id)
  end
end
