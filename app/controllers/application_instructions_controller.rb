class ApplicationInstructionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_application_instruction, only: [:show, :edit, :update, :destroy]

  # GET /application_instructions
  # GET /application_instructions.json
  def index
    @application_instruction = ApplicationInstruction.first
  end

  # GET /application_instructions/1
  # GET /application_instructions/1.json
  def show
  end

  # GET /application_instructions/new
  def new
    @application_instruction = ApplicationInstruction.new
  end

  # GET /application_instructions/1/edit
  def edit
  end

  # POST /application_instructions
  # POST /application_instructions.json
  def create
    @application_instruction = ApplicationInstruction.new(application_instruction_params)

    respond_to do |format|
      if @application_instruction.save
        format.html { redirect_to @application_instruction, notice: 'Application instruction was successfully created.' }
        format.json { render :show, status: :created, location: @application_instruction }
      else
        format.html { render :new }
        format.json { render json: @application_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_instructions/1
  # PATCH/PUT /application_instructions/1.json
  def update
    respond_to do |format|
      if @application_instruction.update(application_instruction_params)
        format.html { redirect_to @application_instruction, notice: 'Application instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_instruction }
      else
        format.html { render :edit }
        format.json { render json: @application_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_instructions/1
  # DELETE /application_instructions/1.json
  def destroy
    @application_instruction.destroy
    respond_to do |format|
      format.html { redirect_to application_instructions_url, notice: 'Application instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_instruction
      @application_instruction = ApplicationInstruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_instruction_params
      params.require(:application_instruction).permit(:content)
    end
end
