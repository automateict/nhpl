class ExamHubsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_exam_hub, only: [:show, :edit, :update, :destroy]

  # GET /exam_hubs
  # GET /exam_hubs.json
  def index
    @exam_hubs = ExamHub.all
  end

  # GET /exam_hubs/1
  # GET /exam_hubs/1.json
  def show
  end

  # GET /exam_hubs/new
  def new
    @exam_hub = ExamHub.new
  end

  # GET /exam_hubs/1/edit
  def edit
  end

  # POST /exam_hubs
  # POST /exam_hubs.json
  def create
    @exam_hub = ExamHub.new(exam_hub_params)

    respond_to do |format|
      if @exam_hub.save
        format.html { redirect_to exam_hubs_path, notice: 'Exam hub was successfully created.' }
        format.json { render :show, status: :created, location: @exam_hub }
      else
        format.html { render :new }
        format.json { render json: @exam_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_hubs/1
  # PATCH/PUT /exam_hubs/1.json
  def update
    respond_to do |format|
      if @exam_hub.update(exam_hub_params)
        format.html { redirect_to exam_hubs_path, notice: 'Exam hub was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_hub }
      else
        format.html { render :edit }
        format.json { render json: @exam_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_hubs/1
  # DELETE /exam_hubs/1.json
  def destroy
    @exam_hub.destroy
    respond_to do |format|
      format.html { redirect_to exam_hubs_url, notice: 'Exam hub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_hub
      @exam_hub = ExamHub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_hub_params
      params.require(:exam_hub).permit(:name, :region_id, :city, :ceiling)
    end
end
