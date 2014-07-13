class ClassifiedPostsController < ApplicationController
  before_action :set_classified_post, only: [:show, :edit, :update, :destroy]

  # GET /classified_posts
  # GET /classified_posts.json
  def index
    @classified_posts = ClassifiedPost.all
  end

  # GET /classified_posts/1
  # GET /classified_posts/1.json
  def show
  end

  # GET /classified_posts/new
  def new
    @classified_post = ClassifiedPost.new
  end

  # GET /classified_posts/1/edit
  def edit
  end

  # POST /classified_posts
  # POST /classified_posts.json
  def create
    @classified_post = ClassifiedPost.new(classified_post_params)
    @classified_post.user = current_user
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
    @category = params[:cat_id]
    @search = params[:search]
    @posts
    if(@search==''||!@search)
      if(@category == ''|| !@category||@category=='0')
        @posts = ClassifiedPost.all.paginate(:page => page)
      else
        @posts = ClassifiedCategory.find(@category).classified_posts.paginate(:page => page)
      end
    else
      if(@category == ''|| !@category||@category=='0')
        @posts = ClassifiedPost.where(["title like ?", "%#{@search}%"]).paginate(:page => page)
      else
        @posts = ClassifiedCategory.find(@category).classified_posts.where(["title like ?", "%#{@search}%"]).paginate(:page => page)
      end
    end
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
