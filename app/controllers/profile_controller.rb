class ProfileController < ApplicationController
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
end
