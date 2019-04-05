class LicenseResultsController < ApplicationController
  before_action :set_license_result, only: [:show, :edit, :update, :destroy]

  # GET /license_results
  # GET /license_results.json
  def index
    @license_results = LicenseResult.all
  end

  # GET /license_results/1
  # GET /license_results/1.json
  def show
  end

  # GET /license_results/new
  def new
    @license_result = LicenseResult.new
  end

  # GET /license_results/1/edit
  def edit
  end

  # POST /license_results
  # POST /license_results.json
  def create
    @license_result = LicenseResult.new(license_result_params)

    respond_to do |format|
      if @license_result.save
        format.html { redirect_to @license_result, notice: 'License result was successfully created.' }
        format.json { render :show, status: :created, location: @license_result }
      else
        format.html { render :new }
        format.json { render json: @license_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /license_results/1
  # PATCH/PUT /license_results/1.json
  def update
    respond_to do |format|
      if @license_result.update(license_result_params)
        format.html { redirect_to @license_result, notice: 'License result was successfully updated.' }
        format.json { render :show, status: :ok, location: @license_result }
      else
        format.html { render :edit }
        format.json { render json: @license_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /license_results/1
  # DELETE /license_results/1.json
  def destroy
    @license_result.destroy
    respond_to do |format|
      format.html { redirect_to license_results_url, notice: 'License result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license_result
      @license_result = LicenseResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_result_params
      params.require(:license_result).permit(:applicant_id, :result)
    end
end
