class PhotosController < ApplicationController
	before_action :authenticate_user!, exept: :index
	before_action :find_photo, only: [:show, :edit, :update, :destroy]
  def index
  	@photos = Photo.all
  end
  def new
  	@photo = Photo.new
  end
  def create
  	@photo = current_user.photos.build(photo_params)
  	if @photo.save
  		redirect_to photos_path
	end
end
  def show
  end
  def edit
  end
  def update
  	@photo.update(photo_params)
     if @photo.save
     	redirect_to root_path(@photo.id)
     end
  end
  def destroy
  @photo.destroy
    redirect_to root_path 
  end
   def find_photo
  	@photo = Photo.find_by(id: params[:id])
  end
  private
  def photo_params
  	params.require(:photo).permit(:user_id, :title, :description, :image)
  end
end
