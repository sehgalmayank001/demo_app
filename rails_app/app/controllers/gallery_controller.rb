class GalleryController < ApplicationController
    before_action :authenticate_user!
  def index
    @images = Image.order("created_at DESC").page(params[:page]).per(3)
  end

  def create
    @image = Image.new(image_upload_params)
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
    debugger
    if @image.update(name: update_name[:name])
      respond_to do |format|
        format.js { render :template => 'gallery/update.js.erb'}
      end
    else
      @error_message = @image.errors.full_messages[0]
      respond_to do |format|
        format.js { render :template => 'gallery/error_name.js.erb'}
      end
    end
  end

  private
  def image_upload_params
    params.require(:image_uploaded).permit(:name ,:image)
  end

  def update_name
    params.require(:image_name_change).permit(:name)
  end

end
