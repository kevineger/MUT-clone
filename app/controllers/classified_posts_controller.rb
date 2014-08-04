class ClassifiedPostsController < ApplicationController
  before_action :set_classified_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new]
  has_scope :category
  has_scope :search_text
  # GET /classified_posts
  # GET /classified_posts.json
  def index
    @classified_posts = apply_scopes(ClassifiedPost).all.paginate(:page => 1)
    @classified_categories = ClassifiedCategory.all
    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /classified_posts/1
  # GET /classified_posts/1.json
  def show
  end
  # GET /classified_posts/new
  def new
    @classified_post = ClassifiedPost.new
    @categories = ClassifiedCategory.all
  end

  # GET /classified_posts/1/edit
  def edit
  end
  def relist
    @classified_post = ClassifiedPost.find(params[:id])
    @classified_post.expiry = Time.now
    @classified_post.save
    render nothing: true
  end

  # POST /classified_posts
  # POST /classified_posts.json
  def create
    @classified_post = ClassifiedPost.new(classified_post_params)
    @classified_post.user = current_user
    @classified_post.expiry = Time.now
    respond_to do |format|
      if @classified_post.save
        format.html { redirect_to @classified_post, notice: 'Classified post was successfully created.' }
        format.json { render :show, status: :created, location: @classified_post }
      else
        format.html { render :new }
        format.json { render json: @classified_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classified_posts/1
  # PATCH/PUT /classified_posts/1.json
  def update
    respond_to do |format|
      if @classified_post.update(classified_post_params)
        format.html { redirect_to @classified_post, notice: 'Classified post was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified_post }
      else
        format.html { render :edit }
        format.json { render json: @classified_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classified_posts/1
  # DELETE /classified_posts/1.json
  def destroy
    @classified_post.destroy
    respond_to do |format|
      format.html { redirect_to classified_posts_url, notice: 'Classified post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def from_category
    page = params[:page]
    if !page
      page = 1
    end
    @posts = apply_scopes(ClassifiedPost).paginate(:page => page)
    respond_to do |format|
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified_post
      @classified_post = ClassifiedPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_post_params
      params.require(:classified_post).permit(:title,:description,:image,:price,:classified_category_id)
    end
end
