class Category < ActiveRecord::Base
<<<<<<< HEAD
  has_many :videos
=======
  has_many :videos, -> {order("created_at DESC")}

  def recent_videos
    videos.first(6)
  end
>>>>>>> mod1
end