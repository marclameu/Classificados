class ProductsController < ApplicationController
  before_filter :carrega_dados
  before_filter :authenticate_user!, :except => [:index, :search, :show]

  # GET /products
  # GET /products.json
  def index
    params[:search_filter] = (!params[:search_filter].present? or params[:search_filter] == 'home') ? '' :params[:search_filter]
    unless params[:search_filter].empty?
      @products = Product.filter_by_category(params[:search_filter]).paginate(:page => params[:page], :per_page => 8)
      flash[:notice] = "Secao de #{params[:search_filter].capitalize}:"
    else
      @products = Product.paginate(:page => params[:page], :per_page => 8)
      flash[:notice] = "Produtos em destaque:"
    end
    
    
    if @products.empty?
      flash[:notice] = "Nenhum produto cadastrado com a categoria informada."
      # redirect_to '/404.html', :status => 404
    end
  end

  def search
    #sleep 2
    @products = Product.search(params[:search], params[:page])
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
    @product.user = current_user

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

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

protected

  def carrega_dados
    @categories = Category.all
    @marks = Mark.all
  end
  

end
