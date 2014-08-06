class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :info]
  before_action :authenticate_user!, only: [:show, :info]
  def show
  end
  def show2
  end
  def info
    respond_to do |format|
      format.js
    end
  end
  def my_profile
    respond_to do |format|
      format.js
    end
  end
  private
  def set_profile
    @user = User.find(params[:id])
  end
end
