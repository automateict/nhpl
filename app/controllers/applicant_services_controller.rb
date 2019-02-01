class ApplicantServicesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant_service, only: [:show, :edit, :update, :destroy]

  # GET /applicant_services
  # GET /applicant_services.json
  def index
    @applicant_services = ApplicantService.all
  end

  # GET /applicant_services/1
  # GET /applicant_services/1.json
  def show
  end

  # GET /applicant_services/new
  def new
    @applicant_service = ApplicantService.new
    @applicant = Applicant.find(params[:applicant])
  end

  # GET /applicant_services/1/edit
  def edit
    @applicant = @applicant_service.applicant
  end

  # POST /applicant_services
  # POST /applicant_services.json
  def create
    @applicant_service = ApplicantService.new(applicant_service_params)
    @served = @applicant_service.status
    @applicant = @applicant_service.applicant

    if @applicant_service.status == 'No'
      params[:applicant_service].delete(:services_attributes)
      @applicant_service.services.destroy_all
    end

    respond_to do |format|
      if @applicant_service.status == 'Yes' and @applicant_service.services.blank?
        flash[:alert] = "You selected yes. Please add service/s to proceed"
        format.html { render :new }
      else
        if @applicant_service.save
          format.html { redirect_to new_program_choice_path(applicant: @applicant.id), notice: 'Applicant service was successfully created.' }
          format.json { render :show, status: :created, location: @applicant_service }
        else
          format.html { render :new }
          format.json { render json: @applicant_service.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /applicant_services/1
  # PATCH/PUT /applicant_services/1.json
  def update
    @applicant = @applicant_service.applicant
    if params[:applicant_service][:status] == 'No'
      params[:applicant_service].delete(:services_attributes)
      @applicant_service.services.destroy_all
    end

    respond_to do |format|
      if @applicant_service.update(applicant_service_params)
        if @applicant_service.status == 'Yes' and @applicant_service.services.blank?
          flash[:alert] =  "You selected yes. Please add service/s to proceed"
          format.html { render :edit }
          else
        format.html { redirect_to new_program_choice_path, notice: 'Applicant service was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant_service }
        end
      else
        format.html { render :edit }
        format.json { render json: @applicant_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_services/1
  # DELETE /applicant_services/1.json
  def destroy
    @applicant_service.destroy
    respond_to do |format|
      format.html { redirect_to applicant_services_url, notice: 'Applicant service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_service
      @applicant_service = ApplicantService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_service_params
      params.require(:applicant_service).permit(:applicant_id, :sponsor, :status,
                                                services_attributes: [:id, :institution, :region_id, :start_date, :end_date, :_destroy])
    end
end
