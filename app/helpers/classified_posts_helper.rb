module ClassifiedPostsHelper
  def is_expired?(post)
   post.expiry < 30.seconds.ago
  end
end
