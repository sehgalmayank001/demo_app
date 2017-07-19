class Api::GalleryController < Api::ApiController
  caches_action :index, expires_in: 5.minutes

  def index
    images = current_user.images
    if images.empty? then raise ActiveRecord::RecordNotFound end
    render json: { data:images, message: 'Successful', status: "Success", code: "200"}, status: 200
  end

  def create
    if !image_upload_params.has_key?(:name) then raise ActionController::ParameterMissing.new('name') end
    if !image_upload_params.has_key?(:image) then raise ActionController::ParameterMissing.new('image') end
    if !image_upload_params.has_key?(:user_id) then raise ActionController::ParameterMissing.new('user_id') end
    unless image_upload_params[:user_id] =~ /\A\d+\z/
      render json: { message: "user_id should only be a number", status: "Failure" ,code: "500"}, status: 500
      return
    end
    image = Image.new(image_upload_params)
    raise MyException::NotAuthorizedException unless request.headers['Authorization'] == User.find(image.user_id).auth_token
    if image.save
      render json:{ data:image, message: "Successful", status: "Success" , code: "200"}, status: 200
    else
      render json: { message: image.errors, status: "failure", code: "500"}, status: 500
    end
  end

  def show
    unless params.require(:id) =~ /\A\d+\z/
      render json: { message: "id should only be a number", status: "Failure" ,code: "500"}, status: 500
      return
    end
    image = Image.find(params.require(:id), :conditions =>["user_id=?",current_user.id])
    if image
      render json: { data:image, message: 'Successful', status: "Success", code: "200"}, status: 200
    else
      render json: { message: image.errors, status: "Failure" ,code: "500"}, status: 500
    end
  end

  private
  def image_upload_params
    params.require(:gallery).require(:image_uploaded).permit(:name ,:image,:user_id)
  end

end
