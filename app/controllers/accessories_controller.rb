class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:edit, :update, :destroy]

  # GET /accessories
  # GET /accessories.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @accessories = @reserve.garrison.accessories
  end

  # GET /accessories/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @accessory = @reserve.garrison.accessories.build
  end

  # GET /accessories/1/edit
  def edit
  end

  # POST /accessories
  # POST /accessories.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @accessory = @reserve.garrison.accessories.build(accessory_params)

    respond_to do |format|
      if @accessory.save
        format.html { redirect_to reserf_garrisons_path, notice: 'Accessory was successfully created.' }
        format.json { render :show, status: :created, location: reserf_garrisons_path }
      else
        format.html { render :new }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accessories/1
  # PATCH/PUT /accessories/1.json
  def update
    respond_to do |format|
      if @accessory.update(accessory_params)
        format.html { redirect_to reserf_garrisons_path, notice: 'Accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_garrisons_path }
      else
        format.html { render :edit }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to reserf_garrisons_url, notice: 'Accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @garrison = @reserve.garrison
      @accessory = Accessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accessory_params
      params.require(:accessory).permit(:description, :amount, :garrison)
    end
end
