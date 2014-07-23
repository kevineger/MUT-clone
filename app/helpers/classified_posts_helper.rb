module ClassifiedPostsHelper
  def is_expired?(post)
   post.expiry < 30.days.ago
  end
end
