module ApplicationHelper
  def options_for_video_reviews(selected = nil)
    options_for_select((1..5).map {|num| [pluralize(num, "Star"), num]}, selected)
  end

  def gravatar_path(user)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}?s=40"

    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(relationship.leader.email.downcase)}?s=40"
  end
end
