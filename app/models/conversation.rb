class Conversation < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :messages
  belongs_to :classified_post
  accepts_nested_attributes_for :messages
end
