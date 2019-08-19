class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :load_applicants, only: [:index, :new,:create, :edit, :update]


  def load_applicants
    academic_year = AcademicYear.current
    @applicants = academic_year.applicants.complete.joins(:exam)
  end

  def import_exam
    if request.post?
      @exams = Exam.import_exam(params[:exam_csv_file])
      flash[:notice] = @exams.blank? ? 'No Exams imported' : 'Exam imported. Check the imported list below'
    end
  end

  def import_interview
    if request.post?
      @interviews = Exam.import_interview(params[:interview_csv_file])
      flash[:notice] = @interviews.blank? ? 'No Interviews imported' : 'Interview imported. Check the imported list below'
    end
  end

  def exam_detail
    user = User.find(params[:user])
    if user.current_application
      @exam = user.current_application.published_exam
    end
    render 'show'
  end

  # GET /exams
  # GET /exams.json
  def index
    @applicants = Applicant.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:applicant_id, :exam_result, :exam_out_of, :interview_result, :interview_out_of, :total)
    end
end
