class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant, only: [:show, :edit, :update, :destroy,:details]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = current_user.applicants rescue nil
  end

  def import_applicants
    if request.post?
      @applicants = Applicant.import_applicants(params[:import_applicant][:applicants_csv_file], params[:import_applicant][:academic_year] )
      flash[:notice] = @applicants.blank? ? 'No applicants imported' : 'Applicants imported. Check the imported list below'
    end
  end

  def university_applicants_by_program
    applicants = current_user.applicants.joins(:program).group('programs.name').count
    render json: applicants
  end

  def licensing
    @applicants = AcademicYear.current.applicants
    @pass = @applicants.joins(:license_result).where('license_results.result = ?', Applicant::PASS)
    @fail_or_ungraded = @applicants - @pass
    @unpublished = @pass.where('license_results.published = ?', nil || false)
  end

  def load_other_university
    university  = University.find_by(id: params[:university])
    if university.name.downcase == 'other'
      @other = true
    end
    render partial: 'other_university'
  end

  def load_attachments
    @applicant_type  = params[:applicant_type]
    render partial: 'attachments'
  end

  def load_disability
    disability  = params[:disability]
    if disability == 'true'
      @disability = true
    end
    render partial: 'disability'
  end

  def grade
    Applicant.grade
    redirect_to licensing_applicants_path
  end

  def publish
    @results = LicenseResult.joins(:applicant).where('academic_year_id = ?', AcademicYear.current.try(:id))
    @results.each do |result|
      exam = result.applicant.exam
      result.update(published: true)
      exam.update(published: true)
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
    @applicant_type = @applicant.applicant_type
    @other = @applicant.university.name.downcase == 'other'
    @disability = @applicant.do_you_have_needs_for_disability == true
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)
    @applicant_type = @applicant.applicant_type
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
    @applicant_type = @applicant.applicant_type
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
                                        :university_id, :other_university, :university_type, :qualification, :date_of_completion, :program_id, :applicant_type, :exam_type,
                                        :do_you_have_needs_for_disability, :disability, :accomodation_request, :i_understand, :i_give_my_permission,
                                        :passport_size_photo, :passport_or_admission_card, :original_diploma, :official_transcript, :authenticated_document_from_herqa)
    end
end
