class MatchResultsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_match_result, only: [:show, :edit, :update, :destroy]

  # GET /match_results
  # GET /match_results.json
  def index
    @match_results = MatchResult.all
  end

  # GET /match_results/1
  # GET /match_results/1.json
  def show
  end

  # GET /match_results/new
  def new
    @match_result = MatchResult.new
  end

  # GET /match_results/1/edit
  def edit
  end

  # POST /match_results
  # POST /match_results.json
  def create
    @match_result = MatchResult.new(match_result_params)

    respond_to do |format|
      if @match_result.save
        format.html { redirect_to @match_result, notice: 'Match result was successfully created.' }
        format.json { render :show, status: :created, location: @match_result }
      else
        format.html { render :new }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_results/1
  # PATCH/PUT /match_results/1.json
  def update
    respond_to do |format|
      if @match_result.update(match_result_params)
        format.html { redirect_to @match_result, notice: 'Match result was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_result }
      else
        format.html { render :edit }
        format.json { render json: @match_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_results/1
  # DELETE /match_results/1.json
  def destroy
    @match_result.destroy
    respond_to do |format|
      format.html { redirect_to match_results_url, notice: 'Match result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_result
      @match_result = MatchResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_result_params
      params.require(:match_result).permit(:applicant_id, :program_id, :university_id)
    end
end
