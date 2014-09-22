class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :info, :posts]
  before_action :authenticate_user!, only: [:show, :info, :posts]
  def show
  end
  def show2
  end
  def settings
    respond_to do |format|
      format.js
    end
  end
  def info
    respond_to do |format|
      format.js
    end
  end
  def my_profile
    include Devise::Controllers::Helpers
    respond_to do |format|
      format.js
    end
  end
  def posts
    @posts = @user.classified_posts
  end
  private
  def set_profile
    @user = User.find(params[:id])
  end
end
