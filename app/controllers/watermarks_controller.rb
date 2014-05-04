class WatermarksController < ApplicationController
  before_action :set_watermark, only: [:show, :edit, :update, :destroy]

  # GET /watermarks
  # GET /watermarks.json
  def index
    @watermarks = Watermark.all
  end

  # GET /watermarks/1
  # GET /watermarks/1.json
  def show
  end

  # GET /watermarks/new
  def new
    @watermark = Watermark.new
  end

  # GET /watermarks/1/edit
  def edit
  end

  # POST /watermarks
  # POST /watermarks.json
  def create
    @watermark = Watermark.new(watermark_params)

    respond_to do |format|
      if @watermark.save
        format.html { redirect_to @watermark, notice: 'Watermark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @watermark }
      else
        format.html { render action: 'new' }
        format.json { render json: @watermark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watermarks/1
  # PATCH/PUT /watermarks/1.json
  def update
    respond_to do |format|
      if @watermark.update(watermark_params)
        format.html { redirect_to @watermark, notice: 'Watermark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @watermark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watermarks/1
  # DELETE /watermarks/1.json
  def destroy
    @watermark.destroy
    respond_to do |format|
      format.html { redirect_to watermarks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watermark
      @watermark = Watermark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watermark_params
      params.require(:watermark).permit(:shop_id)
    end
end
