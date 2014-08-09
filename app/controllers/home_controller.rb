class HomeController < ApplicationController
  def index
    @posts = ClassifiedPost.recent.limit(15)
  end
end
