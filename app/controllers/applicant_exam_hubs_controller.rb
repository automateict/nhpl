class ApplicantExamHubsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant_exam_hub, only: [:show, :edit, :update, :destroy]

  # GET /applicant_exam_hubs
  # GET /applicant_exam_hubs.json
  def index
    @applicant_exam_hubs = ApplicantExamHub.all
  end

  # GET /applicant_exam_hubs/1
  # GET /applicant_exam_hubs/1.json
  def show
  end

  # GET /applicant_exam_hubs/new
  def new
    @applicant_exam_hub = ApplicantExamHub.new
    @applicant = current_user.applicant
  end

  # GET /applicant_exam_hubs/1/edit
  def edit
    @applicant = @applicant_exam_hub.applicant
  end

  # POST /applicant_exam_hubs
  # POST /applicant_exam_hubs.json
  def create
    @applicant_exam_hub = ApplicantExamHub.new(applicant_exam_hub_params)
    @applicant  = @applicant_exam_hub.applicant
    respond_to do |format|
      if @applicant_exam_hub.save
        format.html { redirect_to new_applicant_declaration_path, notice: 'Exam hub was successfully created.' }
        format.json { render :show, status: :created, location: @applicant_exam_hub }
      else
        format.html { render :new }
        format.json { render json: @applicant_exam_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_exam_hubs/1
  # PATCH/PUT /applicant_exam_hubs/1.json
  def update
    @applicant  = @applicant_exam_hub.applicant
    respond_to do |format|
      if @applicant_exam_hub.update(applicant_exam_hub_params)
        if @applicant.applicant_declaration.blank?
          format.html { redirect_to new_applicant_declaration_path, notice: 'Exam hub was successfully updated.' }
        else
          format.html { redirect_to edit_applicant_declaration_path(@applicant.applicant_declaration), notice: 'Exam hub was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @applicant_exam_hub }
      else
        format.html { render :edit }
        format.json { render json: @applicant_exam_hub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_exam_hubs/1
  # DELETE /applicant_exam_hubs/1.json
  def destroy
    @applicant_exam_hub.destroy
    respond_to do |format|
      format.html { redirect_to applicant_exam_hubs_url, notice: 'Applicant exam hub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_exam_hub
      @applicant_exam_hub = ApplicantExamHub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_exam_hub_params
      params.require(:applicant_exam_hub).permit(:applicant_id, :exam_hub_id)
    end
end
