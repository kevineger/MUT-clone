class Comment < ActiveRecord::Base
  belongs_to :classified_post
  belongs_to :user
end
