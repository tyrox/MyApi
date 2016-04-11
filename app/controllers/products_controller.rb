class ProductsController < ApplicationController
  #Autenticar
  protect_from_forgery unless: -> { request.format.json? }
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    render json:@products, status:200    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.find(params[:id])
    render json: @products, status: 200
  end

  # GET /products/new
  def new
    @product = Product.new    
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)    
      if @product.save
        #format.html { redirect_to @product, notice: 'Product was successfully created.' }
        #format.json { render :show, status: :created, location: @product }
        render json: @product, status: 201, location: @product
      else
        #format.html { render :new }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
        render json: @product.errors, status: 422
      end
    #end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        #format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #format.json { render :show, status: :ok, location: @product }
        render json: @product, status: 200, location: @product
      else
        #format.html { render :edit }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
        render json: @product.errors, status: 422
      end
    #end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    #respond_to do |format|
      #format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      #format.json { head :no_content }
      render json: @product, status: 200, location: @product
    #end
  end

  private
    #Autenticación
    
    
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.permit(:name, :description, :state)
    end
end
