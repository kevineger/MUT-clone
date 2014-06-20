class ClassifiedCategory < ActiveRecord::Base
  has_many :classified_posts
end
