  
class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index]

  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all.order(name: :asc)
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
    @strains = Strain.all
    @oenologists = Oenologist.order(:age)
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)
    
    respond_to do |format|
      if @wine.save
        @wine.addStrainPercent(params[:wine][:strains_percent])
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)

        @wine.oenologists.destroy
        @wine.oenologists << Oenologist.where(id: params[:wine])
        @wine.addStrainPercent(params[:wine][:strains_percent])
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    def strains_availables
      @strains = Strain.where(available: true).order("name")
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name,:grade,:strains_percent,:oenologists, {strain_ids:[]})
    end
end