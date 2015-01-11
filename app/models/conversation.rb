class Conversation < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  has_and_belongs_to_many :users
  has_many :messages
  belongs_to :classified_post
  accepts_nested_attributes_for :messages
  def get_other_user(current_user)
    other_user = nil
    self.users.each do |user|
      other_user = user unless user == current_user
    end
    other_user
  end
end
