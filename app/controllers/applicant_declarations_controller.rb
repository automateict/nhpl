class ApplicantDeclarationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_applicant_declaration, only: [:show, :edit, :update, :destroy]

  # GET /applicant_declarations
  # GET /applicant_declarations.json
  def index
    @applicant_declarations = ApplicantDeclaration.all
  end

  # GET /applicant_declarations/1
  # GET /applicant_declarations/1.json
  def show
  end

  # GET /applicant_declarations/new
  def new
    @applicant_declaration = ApplicantDeclaration.new
    @applicant = current_user.applicant
    Declaration.all.each do |d|
      ad = @applicant_declaration.declaration_details.joins(:applicant_declaration).
          where('declaration_id = ? and applicant_id = ?', d.id, @applicant.id)
      if ad.blank?
        @applicant_declaration.declaration_details.build(declaration_id: d.id )
      end
    end
  end

  # GET /applicant_declarations/1/edit
  def edit
    @applicant = @applicant_declaration.applicant
    Declaration.all.each do |d|
      ad = @applicant_declaration.declaration_details.joins(:applicant_declaration).
          where('declaration_id = ? and applicant_id = ?', d.id, @applicant.id)
      if ad.blank?
        @applicant_declaration.declaration_details.build(declaration_id: d.id )
      end
    end
  end

  # POST /applicant_declarations
  # POST /applicant_declarations.json
  def create
    @applicant_declaration = ApplicantDeclaration.new(applicant_declaration_params)
    @applicant = @applicant_declaration.applicant
    respond_to do |format|
      if @applicant_declaration.save
        format.html { redirect_to details_applicant_path(@applicant), notice: 'Congratulations!!! you have successfully submitted your application' }
        format.json { render :show, status: :created, location: @applicant_declaration }
      else
        if @applicant_declaration.declaration_details.blank?
          Declaration.all.each do |d|
            ad = @applicant_declaration.declaration_details.joins(:applicant_declaration).
                where('declaration_id = ? and applicant_id = ?', d.id, @applicant.id)
            if ad.blank?
              @applicant_declaration.declaration_details.build(declaration_id: d.id )
            end
          end
        end
        format.html { render :new }
        format.json { render json: @applicant_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_declarations/1
  # PATCH/PUT /applicant_declarations/1.json
  def update
    @applicant = @applicant_declaration.applicant
    respond_to do |format|
      if @applicant_declaration.update(applicant_declaration_params)
        format.html { redirect_to details_applicant_path(@applicant), notice: 'You have successfully finished your application. Make sure everything is right before you submit.' }
        format.json { render :show, status: :ok, location: @applicant_declaration }
      else
        format.html { render :edit }
        format.json { render json: @applicant_declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_declarations/1
  # DELETE /applicant_declarations/1.json
  def destroy
    @applicant_declaration.destroy
    respond_to do |format|
      format.html { redirect_to applicant_declarations_url, notice: 'Applicant declaration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_declaration
      @applicant_declaration = ApplicantDeclaration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_declaration_params
      params.require(:applicant_declaration).permit(:applicant_id,
                                                    declaration_details_attributes: [:id, :applicant_declaration_id, :declaration_id, :status, :_destroy ])
    end
end
