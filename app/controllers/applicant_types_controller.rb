class ApplicantTypesController < ApplicationController
  before_action :set_applicant_type, only: [:show, :edit, :update, :destroy]

  # GET /applicant_types
  # GET /applicant_types.json
  def index
    @applicant_types = ApplicantType.all
  end

  # GET /applicant_types/1
  # GET /applicant_types/1.json
  def show
  end

  # GET /applicant_types/new
  def new
    @applicant_type = ApplicantType.new
  end

  # GET /applicant_types/1/edit
  def edit
  end

  # POST /applicant_types
  # POST /applicant_types.json
  def create
    @applicant_type = ApplicantType.new(applicant_type_params)

    respond_to do |format|
      if @applicant_type.save
        format.html { redirect_to @applicant_type, notice: 'Applicant type was successfully created.' }
        format.json { render :show, status: :created, location: @applicant_type }
      else
        format.html { render :new }
        format.json { render json: @applicant_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_types/1
  # PATCH/PUT /applicant_types/1.json
  def update
    respond_to do |format|
      if @applicant_type.update(applicant_type_params)
        format.html { redirect_to @applicant_type, notice: 'Applicant type was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant_type }
      else
        format.html { render :edit }
        format.json { render json: @applicant_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_types/1
  # DELETE /applicant_types/1.json
  def destroy
    @applicant_type.destroy
    respond_to do |format|
      format.html { redirect_to applicant_types_url, notice: 'Applicant type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_type
      @applicant_type = ApplicantType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_type_params
      params.require(:applicant_type).permit(:name, :description)
    end
end
