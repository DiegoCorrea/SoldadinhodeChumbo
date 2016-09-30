class GarrisonsController < ApplicationController
  before_action :set_garrison, only: [:show, :edit, :update, :destroy]

  # GET /garrisons
  # GET /garrisons.json
  def index
    @reserve = Reserve.where(id: params[:reserf_id]).first
    @garrison = @reserve.garrison
    @weapons = Weapon.where(garrison: @garrison)
    @munitions = Munition.where(garrison: @garrison)
    @accessories = Accessory.where(garrison: @garrison)
  end

  # DELETE /garrisons/1
  # DELETE /garrisons/1.json
  def destroy
    @garrison.destroy
    respond_to do |format|
      format.html { redirect_to garrisons_url, notice: 'Garrison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garrison
      @garrison = Garrison.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garrison_params
      params.require(:garrison).permit(:reserve_id)
    end
end
