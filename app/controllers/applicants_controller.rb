class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant, only: [:show, :edit, :update, :destroy,:details]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = AcademicYear.current.applicants rescue nil
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
  end

  def details
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "application_details",
               disposition: 'attachment'
      end
    end
  end

  def submit
    @applicant.update(status: true)
    redirect_to details_applicant_path(@applicant)
  end

  def instructions

  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)
    respond_to do |format|
      if @applicant.save
          format.html { redirect_to new_applicant_service_path(applicant: @applicant.id), notice: 'Applicant was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        if @applicant.applicant_service.blank?
          format.html { redirect_to new_applicant_service_path(applicant: @applicant.id), notice: 'Applicant was successfully updated.' }
        else
          format.html { redirect_to edit_applicant_service_path(@applicant.applicant_service), notice: 'Applicant was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit(:academic_year_id,:title, :place_of_birth, :marital_status, :region_id, :city, :street, :pobox, :phone,
                                        :user_id,:first_name, :father_name, :grand_father_name, :gender, :date_of_birth, :nationality, :institution, :institution_type, :qualification, :date_of_completion, :applicant_type, :exam_type,
                                        program_choice_attributes: [:id, :applicant_id, :program_id, :choice_order, :_destroy])
    end
end
