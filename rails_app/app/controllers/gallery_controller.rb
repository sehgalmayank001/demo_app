class GalleryController < ApplicationController

  def index
    @images = current_user.images.order("created_at DESC").page(params[:page]).per(3)
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
  end

  def create
    @image = Image.new(image_upload_params)
    @image.user_id = current_user.id
    if @image.save
        redirect_to images_path
    else
      @error_message = @image.errors.full_messages[0]
      respond_to do |format|
        format.js { render :template => 'gallery/error.js.erb'}
      end
    end
  end

  def update
    @image= Image.find(params[:id])
    @oldname = @image.name
    @id = params[:id]
     update_name[:name]!= "" ? name_up = update_name[:name] : name_up = @oldname
     update_name[:image]!= nil ? img_up = update_name[:image] : img_up = @image.image
    if @image.update(name: name_up, image: img_up)
      if update_name[:image]== nil
        respond_to do |format|
          format.js { render :template => 'gallery/update.js.erb'}
        end
      else
        redirect_to images_path, alert: "Image Changed."
      end
    else
      @error_message = @image.errors.full_messages[0]
      respond_to do |format|
        format.js { render :template => 'gallery/error_name.js.erb'}
      end
    end
  end

  def import
    @errors = Image.import(upload_csv[:file],current_user.id)
    if @errors.present?
      respond_to do |format|
        format.js { render :template => 'gallery/csv_error.js.erb'}
      end
    else
      redirect_to images_path, alert: "Images Uploaded"
    end
  end

  def get_img_cnt
    sleep 1.5
      render json: current_user.images.count, status: 200
  end

  private
  def image_upload_params
    params.require(:image_uploaded).permit(:name ,:image)
  end

  def update_name
    params.require(:image_name_change).permit(:name, :image)
  end

  def upload_csv
    params.require(:csv_upload).permit(:file)
  end

end
