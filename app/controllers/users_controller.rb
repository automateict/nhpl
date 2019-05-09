class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  layout 'application'
  before_action :set_user, only: [:show, :edit, :update, :destroy,:confirm]

  def load_institutions
    @role  = params[:role]
    render partial: 'institution'
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def confirm
    respond_to do |format|
      if @user.confirm
        format.html { redirect_to users_path, notice: 'User was successfully confirmed.' }
      end
    end
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @role = @user.role
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @role = user_params[:role]
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @role = user_params[:role]
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :university_id, :admin)
    end
end
