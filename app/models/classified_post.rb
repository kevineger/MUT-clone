class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user
end
