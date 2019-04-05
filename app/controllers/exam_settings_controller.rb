class ExamSettingsController < ApplicationController
  before_action :set_exam_setting, only: [:show, :edit, :update, :destroy]

  # GET /exam_settings
  # GET /exam_settings.json
  def index
    @exam_settings = ExamSetting.all
  end

  # GET /exam_settings/1
  # GET /exam_settings/1.json
  def show
  end

  # GET /exam_settings/new
  def new
    @exam_setting = ExamSetting.new
  end

  # GET /exam_settings/1/edit
  def edit
  end

  # POST /exam_settings
  # POST /exam_settings.json
  def create
    @exam_setting = ExamSetting.new(exam_setting_params)

    respond_to do |format|
      if @exam_setting.save
        format.html { redirect_to exam_settings_path, notice: 'Exam setting was successfully created.' }
        format.json { render :show, status: :created, location: @exam_setting }
      else
        format.html { render :new }
        format.json { render json: @exam_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_settings/1
  # PATCH/PUT /exam_settings/1.json
  def update
    respond_to do |format|
      if @exam_setting.update(exam_setting_params)
        format.html { redirect_to exam_settings_path, notice: 'Exam setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_setting }
      else
        format.html { render :edit }
        format.json { render json: @exam_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_settings/1
  # DELETE /exam_settings/1.json
  def destroy
    @exam_setting.destroy
    respond_to do |format|
      format.html { redirect_to exam_settings_url, notice: 'Exam setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_setting
      @exam_setting = ExamSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_setting_params
      params.require(:exam_setting).permit(:academic_year_id, :program_id, :passing_mark)
    end
end
