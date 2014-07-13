class Conversation < ActiveRecord::Base
  has_many :users
  has_many :posts
  belongs_to :classified_post
end
