class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create

    @product = Product.new(params[:product])
          @a = @product.vat
          @b = @a / 100.0 *@product.price
          @product.total = @b + @product.price
    # if Product.last
    #       @last = Product.last.prid
    #       @temp = @last.gsub(/[^\d]/, '')
    #       @prid = "PDCT #{@temp.to_i + 1}"
    #     else
    #       @prid = "PDCT 1001"
    #     end
    @c = @product.quantity
          @d = @c * @product.price
          @product.total = @d

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
        @product = Product.find(params[:id])
        if @product.update_attributes(params[:product])
          redirect_to :action => 'show', :id => @product
        else
          render :action => 'edit'

        end
    end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
     redirect_to :action => 'index'
  
  end
end
