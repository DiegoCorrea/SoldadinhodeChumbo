class MunitionsController < ApplicationController
  before_action :set_munition, only: [:edit, :update, :destroy]

  # GET /munitions
  # GET /munitions.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @munitions = @reserve.garrison.munitions
  end

  # GET /munitions/new
  def new
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @munition = @reserve.garrison.munitions.build
  end

  # GET /munitions/1/edit
  def edit
  end

  # POST /munitions
  # POST /munitions.json
  def create
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @munition = @reserve.garrison.munitions.build(munition_params)

    respond_to do |format|
      if @munition.save
        format.html { redirect_to reserf_garrisons_path, notice: 'Munition was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /munitions/1
  # PATCH/PUT /munitions/1.json
  def update
    respond_to do |format|
      if @munition.update(munition_params)
        format.html { redirect_to reserf_garrisons_path, notice: 'Munition was successfully updated.' }
        format.json { render :show, status: :ok, location: reserf_garrisons }
      else
        format.html { render :edit }
        format.json { render json: @munition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /munitions/1
  # DELETE /munitions/1.json
  def destroy
    @munition.destroy
    respond_to do |format|
      format.html { redirect_to reserf_garrisons_url, notice: 'Munition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_munition
      @reserve = Reserve.where(id: params[:reserf_id]).first
      @garrison = @reserve.garrison
      @munition = Munition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def munition_params
      params.require(:munition).permit(:caliber, :amount, :description, :garrison)
    end
end
