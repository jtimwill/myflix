class Admin::VideosController < ApplicationController
  before_action :require_user

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(admin_video_params)
    if @video.save
      flash[:success] = "You have successfully added the video '#{@video.title}'."
      redirect_to new_admin_video_path
    else
      flash.now[:danger] = "You cannot add this video. Please check the errors."
      render :new
    end
  end

  private

  def admin_video_params
    params.require(:video).permit(:title, :category_id, :description, :large_cover, :small_cover, :video_url)
  end
end
