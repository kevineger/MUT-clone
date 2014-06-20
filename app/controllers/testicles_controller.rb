class TesticlesController < ApplicationController
  before_action :set_testicle, only: [:show, :edit, :update, :destroy]

  # GET /testicles
  # GET /testicles.json
  def index
    @testicles = Testicle.all
  end

  # GET /testicles/1
  # GET /testicles/1.json
  def show
  end

  # GET /testicles/new
  def new
    @testicle = Testicle.new
  end

  # GET /testicles/1/edit
  def edit
  end

  # POST /testicles
  # POST /testicles.json
  def create
    @testicle = Testicle.new(testicle_params)

    respond_to do |format|
      if @testicle.save
        format.html { redirect_to @testicle, notice: 'Testicle was successfully created.' }
        format.json { render :show, status: :created, location: @testicle }
      else
        format.html { render :new }
        format.json { render json: @testicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testicles/1
  # PATCH/PUT /testicles/1.json
  def update
    respond_to do |format|
      if @testicle.update(testicle_params)
        format.html { redirect_to @testicle, notice: 'Testicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @testicle }
      else
        format.html { render :edit }
        format.json { render json: @testicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testicles/1
  # DELETE /testicles/1.json
  def destroy
    @testicle.destroy
    respond_to do |format|
      format.html { redirect_to testicles_url, notice: 'Testicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testicle
      @testicle = Testicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testicle_params
      params.require(:testicle).permit(:size)
    end
end
