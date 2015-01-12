class Conversation < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  has_and_belongs_to_many :users
  has_many :messages
  belongs_to :classified_post
  accepts_nested_attributes_for :messages
  def get_other_user(current_user_id)
    if self.users.first.id == current_user_id
      self.users.first
    else
      self.users.second
    end
  end
end
