class HomeController < ApplicationController
  def index
    @classified_post = ClassifiedPost.last
  end
end
