class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    users = User.all
    render json:users, status:200
  end

  # GET /users/1
  # GET /users/1.json
  def show
    users = User.find(params[:id])
    render json: users, status: 200
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /session/authenticate/
  def autenticación
    
  end


  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)

    #respond_to do |format|
      if user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
        render json: user, status: 201, location: user
        
      else
        #format.html { render :new }
       render json: user.errors, status: 422
      #end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
      if @user.update(user_params)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        render json: @user, status: 201, location: @user
      else
        render json: @user.errors, status: 422
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    #respond_to do |format|
      #format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      render json: @user, status: 201, location: @user
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :firstname)
    end
end
