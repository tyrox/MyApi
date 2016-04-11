class TransactionsController < ApplicationController
  #Autenticar
  #before_action :authenticate 
  protect_from_forgery unless: -> { request.format.json? }
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
    render json:@transactions, status:200
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transactions = Transaction.find(params[:id])
    render json: @transactions, status: 200
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    #respond_to do |format|
      if @transaction.save
        #format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        #format.json { render :show, status: :created, location: @transaction }
        render json: @transaction, status: 201, location: @transaction
      else
        #format.html { render :new }
        #format.json { render json: @transaction.errors, status: :unprocessable_entity }
        render json: @transaction.errors, status: 422
      #end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    #respond_to do |format|
      if @transaction.update(transaction_params)
        #format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        #format.json { render :show, status: :ok, location: @transaction }
        render json: @transaction, status: 200, location: @transaction
      else
        #format.html { render :edit }
        #format.json { render json: @transaction.errors, status: :unprocessable_entity }
        render json: @transaction.errors, status: 422
      end
    #end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    #respond_to do |format|
      #format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      #format.json { head :no_content }
      render json: @transaction, status: 201, location: @transaction
    #end
  end

  private
    #Autenticación
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        tk=token
        Session.find_by(auth_token: token)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.permit(:product_req_id, :product_offered_id)
    end
end
