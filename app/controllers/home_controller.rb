class HomeController < ApplicationController
  has_scope :current, type: :boolean, allow_blank: true, default: 1
  has_scope :recent, type: :boolean, allow_blank: true, default: 1
  def index
    @posts = apply_scopes(ClassifiedPost).recent.limit(15)
  end
end
