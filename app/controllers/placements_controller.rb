class PlacementsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_placement, only: [:show, :edit, :update, :destroy]
  before_action :load_applicants, only: [:new, :create, :edit, :update]


  def load_applicants
    academic_year = AcademicYear.current
    @applicants = academic_year.applicants.complete.includes(:placement).where(placements: {id: nil})
  end

  # GET /placements
  # GET /placements.json
  def index
    @placements = Placement.joins(:applicant).where('academic_year_id = ?',AcademicYear.current.try(:id))
    @unpublished = @placements.where('published is null')
    @unmatched_applicants = Applicant.includes(:placement).where(placements: {id: nil}).where('academic_year_id = ?',AcademicYear.current.try(:id))
  end

  def match
    Applicant.match
    redirect_to placements_path
  end

  def clear
    @placements = Placement.joins(:applicant).where('academic_year_id = ?',AcademicYear.current.try(:id))
    @placements.destroy_all
    redirect_to placements_path
  end

  def publish
    @placements = Placement.joins(:applicant).where('academic_year_id = ?',AcademicYear.current.try(:id))
    @placements.update(published: true)
    redirect_to placements_path
  end

  def statistics
    @academic_year = AcademicYear.current
    @program_quotas = @academic_year.program_quotas
  end
  # GET /placements/1
  # GET /placements/1.json
  def show
  end

  # GET /placements/new
  def new
    @placement = Placement.new
  end

  # GET /placements/1/edit
  def edit
  end

  # POST /placements
  # POST /placements.json
  def create
    @placement = Placement.new(placement_params)

    respond_to do |format|
      if @placement.save
        format.html { redirect_to @placement, notice: 'Placement was successfully created.' }
        format.json { render :show, status: :created, location: @placement }
      else
        format.html { render :new }
        format.json { render json: @placement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placements/1
  # PATCH/PUT /placements/1.json
  def update
    respond_to do |format|
      if @placement.update(placement_params)
        format.html { redirect_to @placement, notice: 'Placement was successfully updated.' }
        format.json { render :show, status: :ok, location: @placement }
      else
        format.html { render :edit }
        format.json { render json: @placement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placements/1
  # DELETE /placements/1.json
  def destroy
    @placement.destroy
    respond_to do |format|
      format.html { redirect_to placements_url, notice: 'Placement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placement
      @placement = Placement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def placement_params
      params.require(:placement).permit(:applicant_id, :program_id, :university_id, :published)
    end
end
