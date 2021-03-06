class SesionesController < ApplicationController
  #before_action :set_sesione, only: [:show, :edit, :update, :destroy]

  # GET /sesiones
  # GET /sesiones.json
  #def index
    #@sesiones = Sesione.all
  #end

  # GET /sesiones/1
  # GET /sesiones/1.json
  #def show
  #end

  # GET /sesiones/new
  #def new
    #@sesione = Sesione.new
  #end

  # GET /sesiones/1/edit
  #def edit
  #end

  # POST /sesiones
  # POST /sesiones.json
  def create    
      @user = User.find_by(username: params[:username])
        if @user.present? && @user.authenticate(params[:password])
          @sesione = Sesione.new(user_id: @user.id, auth_token: generate_auth_token)
          if @sesione.present?
            @sesione.save
            render json: @sesione.auth_token, status: 201, location: @transaction
          else            
            render json: @sesione.errors, status: 422
        end
      end                                        
  end
  def generate_auth_token
       SecureRandom.uuid.gsub(/\-/,'')
  end

  # PATCH/PUT /sesiones/1
  # PATCH/PUT /sesiones/1.json
  #def update
   # respond_to do |format|
    #  if @sesione.update(sesione_params)
     #   format.html { redirect_to @sesione, notice: 'Sesione was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @sesione }
      #else
       # format.html { render :edit }
        #format.json { render json: @sesione.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /sesiones/1
  # DELETE /sesiones/1.json
  def destroy
    @sesione.destroy
    #respond_to do |format|
      #format.html { redirect_to sesiones_url, notice: 'Sesione was successfully destroyed.' }
      #format.json { head :no_content }
      render json: @sesione, status: 201, location: @sesione
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesione
      @sesione = Sesione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesione_params
      params.permit(:user_id, :token_auth)
    end
end
