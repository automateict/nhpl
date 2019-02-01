class PassingMarksController < ApplicationController
  before_action :set_passing_mark, only: [:show, :edit, :update, :destroy]

  # GET /passing_marks
  # GET /passing_marks.json
  def index
    @passing_marks = PassingMark.all
  end

  # GET /passing_marks/1
  # GET /passing_marks/1.json
  def show
  end

  # GET /passing_marks/new
  def new
    @passing_mark = PassingMark.new
  end

  # GET /passing_marks/1/edit
  def edit
  end

  # POST /passing_marks
  # POST /passing_marks.json
  def create
    @passing_mark = PassingMark.new(passing_mark_params)

    respond_to do |format|
      if @passing_mark.save
        format.html { redirect_to @passing_mark, notice: 'Passing mark was successfully created.' }
        format.json { render :show, status: :created, location: @passing_mark }
      else
        format.html { render :new }
        format.json { render json: @passing_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passing_marks/1
  # PATCH/PUT /passing_marks/1.json
  def update
    respond_to do |format|
      if @passing_mark.update(passing_mark_params)
        format.html { redirect_to @passing_mark, notice: 'Passing mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @passing_mark }
      else
        format.html { render :edit }
        format.json { render json: @passing_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passing_marks/1
  # DELETE /passing_marks/1.json
  def destroy
    @passing_mark.destroy
    respond_to do |format|
      format.html { redirect_to passing_marks_url, notice: 'Passing mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passing_mark
      @passing_mark = PassingMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passing_mark_params
      params.require(:passing_mark).permit(:academic_year_id, :program_id, :passing_mark)
    end
end
