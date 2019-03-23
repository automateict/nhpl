class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant, only: [:show, :edit, :update, :destroy,:details]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = AcademicYear.current.applicants rescue nil
  end

  def load_other_university
    university  = University.find_by(id: params[:university])
    if university.name.downcase == 'other'
      @other = true
      render partial: 'other_university'
    end
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "application_details",
               disposition: 'attachment'
      end
    end
  end

  def details
  
  end

  def submit
    @applicant.update(status: true)
    redirect_to @applicant
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
          format.html { redirect_to @applicant, notice: 'Application successfully Saved.' }
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
          format.html { redirect_to @applicant, notice: 'Application successfully updated.' }
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
      params.require(:applicant).permit(:user_id, :academic_year_id,:title, :first_name, :father_name, :grand_father_name, :gender, :date_of_birth,
                                        :place_of_birth, :marital_status, :nationality, :region_id, :city, :street, :pobox, :phone,
                                        :university_id, :university_type_id, :qualification, :date_of_completion, :program_id, :applicant_type_id, :exam_type_id,
                                        :do_you_have_needs_for_disability, :disability, :accomodation_request, :i_understand, :i_give_my_permission,
                                        files: [])
    end
end
