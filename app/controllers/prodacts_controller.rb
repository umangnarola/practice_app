class ProdactsController < ApplicationController
  before_action :set_prodact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :redirect_unless_admin, except: [:create, :new, :create,  :index,:show]

  # GET /prodacts
  # GET /prodacts.json

  def index
    @prodacts_all = Prodact.paginate :page => params[:page], :per_page => 5
    @prodacts = Prodact.prodacts.paginate :page => params[:page], :per_page => 5
  end


  def show
  end

  # GET /prodacts/new
  def new
    @prodact = Prodact.new
  end

  # GET /prodacts/1/edit
  def edit

  end

  def create
    @prodact = Prodact.new(prodact_params)
    respond_to do |format|
      if @prodact.save
        format.html { redirect_to @prodact, notice: 'Prodact was successfully created.' }
        format.json { render :show, status: :created, location: @prodact }
      else
        format.html { render :new }
        format.json { render json: @prodact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prodacts/1
  # PATCH/PUT /prodacts/1.json
  def update
    respond_to do |format|
      if @prodact.update(prodact_params)
        format.html { redirect_to @prodact, notice: 'Prodact was successfully updated.' }
        format.json { render :show, status: :ok, location: @prodact }
      else
        format.html { render :edit }
        format.json { render json: @prodact.errors, status: :unprocessable_entity }
      end
    end
  end

  def updatestatus
    @product_update = Prodact.find(params[:p_id])
    if @product_update.is_active == true
       @product_update.update!(is_active: false)
    else
       @product_update.update!(is_active: true)
    end
    respond_to do |format|
      format.js
    end
  end
  # DELETE /prodacts/1
  # DELETE /prodacts/1.json
  def destroy
    @prodact.destroy
    respond_to do |format|
      format.html { redirect_to prodacts_url, notice: 'Prodact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prodact
      @prodact = Prodact.find(params[:id])
    end

    def redirect_unless_admin
      unless current_user.role == "admin"
        redirect_to prodacts_path
        flash[:error] = "No Access Rights"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prodact_params
      params.require(:prodact).permit(:user_id,:name, :decription, :price, :quantity)
    end

end
