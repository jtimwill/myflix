class VideosController < ApplicationController
  before_action :set_video, only: [:show]
  before_action :require_user

  def index
    @category = Category.all
  end

  def show
    @video = VideoDecorator.decorate(Video.find(params[:id]))
    @reviews = @video.reviews
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end

  def advanced_search
    if params[:query]
      @videos = Video.search(params[:query]).records.to_a
    else
      @videos = []
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end
end
